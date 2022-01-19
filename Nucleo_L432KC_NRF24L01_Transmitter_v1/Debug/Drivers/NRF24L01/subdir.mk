################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/NRF24L01/nrf24.c 

OBJS += \
./Drivers/NRF24L01/nrf24.o 

C_DEPS += \
./Drivers/NRF24L01/nrf24.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/NRF24L01/nrf24.o: ../Drivers/NRF24L01/nrf24.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DDEBUG -DSTM32L432xx -c -I../Inc -I../Drivers/NRF24L01 -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/NRF24L01/nrf24.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

