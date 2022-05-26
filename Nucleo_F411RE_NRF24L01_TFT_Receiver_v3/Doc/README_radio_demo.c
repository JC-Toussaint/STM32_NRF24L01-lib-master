// part of radio_demo.c Created by ilia.motornyi on 13-Dec-18.

uint8_t nRF24_payload[32];

#define DEMO_RX_SINGLE      0 // Single address receiver (1 pipe)
#define DEMO_RX_MULTI       0 // Multiple address receiver (3 pipes)
#define DEMO_RX_SOLAR       0 // Solar temperature sensor receiver
#define DEMO_TX_SINGLE      0 // Single address transmitter (1 pipe)
#define DEMO_TX_MULTI       0 // Multiple address transmitter (3 pipes)
#define DEMO_RX_SINGLE_ESB  0 // Single address receiver with Enhanced ShockBurst (1 pipe)
#define DEMO_TX_SINGLE_ESB  0 // Single address transmitter with Enhanced ShockBurst (1 pipe)
#define DEMO_RX_ESB_ACK_PL  1 // Single address receiver with Enhanced ShockBurst (1 pipe) + payload sent back
#define DEMO_TX_ESB_ACK_PL  0 // Single address transmitter with Enhanced ShockBurst (1 pipe) + payload received in ACK

int runRadio(void) {
    UART_SendStr("\r\nSTM32F411RE Receiver is online.\r\n");

    // RX/TX disabled
    nRF24_CE_L();
    HAL_Delay(1000);

    // Configure the nRF24L01+
    UART_SendStr("nRF24L01+ check: ");
// #pragma clang diagnostic push
// #pragma clang diagnostic ignored "-Wmissing-noreturn"
    if (!nRF24_Check()) {
        UART_SendStr("FAIL\r\n");
        while (1) {
            Toggle_LED();
            Delay_ms(50);
        }
    }
// #pragma clang diagnostic pop
    UART_SendStr("OK\r\n");

    // Initialize the nRF24L01 to its default state
    nRF24_Init();

/***************************************************************************/

#if (DEMO_RX_ESB_ACK_PL)

    // This is simple receiver with Enhanced ShockBurst:
    //   - RX address: 'ESB'
    //   - payload: 10 bytes
    //   - RF channel: 40 (2440MHz)
    //   - data rate: 2Mbps
    //   - CRC scheme: 2 byte

    // The transmitter sends a 10-byte packets to the address 'ESB' with Auto-ACK (ShockBurst enabled)

    // Set RF channel
    nRF24_SetRFChannel(40);

    // Set data rate
    nRF24_SetDataRate(nRF24_DR_2Mbps);

    // Set CRC scheme
    nRF24_SetCRCScheme(nRF24_CRC_2byte);

    // Set address width, its common for all pipes (RX and TX)
    nRF24_SetAddrWidth(3);

    // Configure RX PIPE
    static const uint8_t nRF24_ADDR[] = {'E', 'S', 'B'};
    nRF24_SetAddr(nRF24_PIPE1, nRF24_ADDR); // program address for pipe
    nRF24_SetRXPipe(nRF24_PIPE1, nRF24_AA_ON, 10); // Auto-ACK: enabled, payload length: 10 bytes

    // Set TX power for Auto-ACK (maximum, to ensure that transmitter will hear ACK reply)
    nRF24_SetTXPower(nRF24_TXPWR_0dBm);

    // Set operational mode (PRX == receiver)
    nRF24_SetOperationalMode(nRF24_MODE_RX);

    // Clear any pending IRQ flags
    nRF24_ClearIRQFlags();

    // Wake the transceiver
    nRF24_SetPowerMode(nRF24_PWR_UP);

    // Enable DPL
    nRF24_SetDynamicPayloadLength(nRF24_DPL_ON);

    nRF24_SetPayloadWithAck(1);


        // Put the transceiver to the RX mode
    nRF24_CE_H();


    // The main loop
// #pragma clang diagnostic push
// #pragma clang diagnostic ignored "-Wmissing-noreturn"
    BSP_LCD_Clear(LCD_COLOR_BLACK);
    /* Set Menu font */
    BSP_LCD_SetFont(&Font8);

    /* Set Text color */
    BSP_LCD_SetTextColor(LCD_COLOR_RED);
    uint8_t nrow=0;
    while (1) {
        //
        // Constantly poll the status of the RX FIFO and get a payload if FIFO is not empty
        //
        // This is far from best solution, but it's ok for testing purposes
        // More smart way is to use the IRQ pin :)
        //
        if (nRF24_GetStatus_RXFIFO() != nRF24_STATUS_RXFIFO_EMPTY) {
            // Get a payload from the transceiver
            pipe = nRF24_ReadPayloadDpl(nRF24_payload, &payload_length);
            if(payload_length > 0) {
                nRF24_WriteAckPayload(pipe, "aCk PaYlOaD",11);
            }

            // Clear all pending IRQ flags
            nRF24_ClearIRQFlags();

            // Print a payload contents to UART
            UART_SendStr("RCV PIPE#");
            UART_SendInt(pipe);
            UART_SendStr(" PAYLOAD:>");
            Toggle_LED();
            UART_SendBufHex((char *) nRF24_payload, payload_length);
            UART_SendStr("<\r\n");

            uint8_t *buf=nRF24_payload;
            uint8_t str[64]={0};
            for (i = 0; i < payload_length; i++) {
                uint8_t ch = *buf++;
                str[2*i  ]=HEX_CHARS[(ch >> 4) % 0x10];
                str[2*i+1]=HEX_CHARS[(ch & 0x0f) % 0x10];
            }

            /* Display message */
            BSP_LCD_DisplayStringAtLine(nrow++, (uint8_t*)str);
            if (nrow>20) {
            	BSP_LCD_Clear(LCD_COLOR_BLACK);
            	nrow=0;
            }
        }
    }
// #pragma clang diagnostic pop

#endif // DEMO_RX_SINGLE_ESB

/***************************************************************************/

#if (DEMO_TX_SINGLE_ESB)

    // This is simple transmitter with Enhanced ShockBurst (to one logic address):
    //   - TX address: 'ESB'
    //   - payload: 10 bytes
    //   - RF channel: 40 (2440MHz)
    //   - data rate: 2Mbps
    //   - CRC scheme: 2 byte

    // The transmitter sends a 10-byte packets to the address 'ESB' with Auto-ACK (ShockBurst enabled)

    // Set RF channel
    nRF24_SetRFChannel(40);

    // Set data rate
    nRF24_SetDataRate(nRF24_DR_2Mbps);

    // Set CRC scheme
    nRF24_SetCRCScheme(nRF24_CRC_2byte);

    // Set address width, its common for all pipes (RX and TX)
    nRF24_SetAddrWidth(3);

    // Configure TX PIPE
    static const uint8_t nRF24_ADDR[] = { 'E', 'S', 'B' };
    nRF24_SetAddr(nRF24_PIPETX, nRF24_ADDR); // program TX address
    nRF24_SetAddr(nRF24_PIPE0, nRF24_ADDR); // program address for pipe#0, must be same as TX (for Auto-ACK)

    // Set TX power (maximum)
    nRF24_SetTXPower(nRF24_TXPWR_0dBm);

    // Configure auto retransmit: 10 retransmissions with pause of 2500s in between
    nRF24_SetAutoRetr(nRF24_ARD_2500us, 10);

    // Enable Auto-ACK for pipe#0 (for ACK packets)
    nRF24_EnableAA(nRF24_PIPE0);

    // Set operational mode (PTX == transmitter)
    nRF24_SetOperationalMode(nRF24_MODE_TX);

    // Clear any pending IRQ flags
    nRF24_ClearIRQFlags();

    // Wake the transceiver
    nRF24_SetPowerMode(nRF24_PWR_UP);


    // Some variables
    uint32_t packets_lost = 0; // global counter of lost packets
    uint8_t otx;
    uint8_t otx_plos_cnt; // lost packet count
    uint8_t otx_arc_cnt; // retransmit count


    // The main loop
    payload_length = 10;
    j = 0;
    while (1) {
        // Prepare data packet
        for (i = 0; i < payload_length; i++) {
            nRF24_payload[i] = j++;
            if (j > 0x000000FF) j = 0;
        }

        // Print a payload
        UART_SendStr("PAYLOAD:>");
        UART_SendBufHex((char *)nRF24_payload, payload_length);
        UART_SendStr("< ... TX: ");

        // Transmit a packet
        tx_res = nRF24_TransmitPacket(nRF24_payload, payload_length);
        otx = nRF24_GetRetransmitCounters();
        otx_plos_cnt = (otx & nRF24_MASK_PLOS_CNT) >> 4; // packets lost counter
        otx_arc_cnt  = (otx & nRF24_MASK_ARC_CNT); // auto retransmissions counter
        switch (tx_res) {
            case nRF24_TX_SUCCESS:
                UART_SendStr("OK");
                break;
            case nRF24_TX_TIMEOUT:
                UART_SendStr("TIMEOUT");
                break;
            case nRF24_TX_MAXRT:
                UART_SendStr("MAX RETRANSMIT");
                packets_lost += otx_plos_cnt;
                nRF24_ResetPLOS();
                break;
            default:
                UART_SendStr("ERROR");
                break;
        }
        UART_SendStr("   ARC=");
        UART_SendInt(otx_arc_cnt);
        UART_SendStr(" LOST=");
        UART_SendInt(packets_lost);
        UART_SendStr("\r\n");

        // Wait ~0.5s
        Delay_ms(500);
    }


#endif // DEMO_TX_SINGLE_ESB

}
