################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/NRF24L01/nrf24.c 

OBJS += \
./Drivers/NRF24L01/nrf24.o 

C_DEPS += \
./Drivers/NRF24L01/nrf24.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/NRF24L01/%.o Drivers/NRF24L01/%.su: ../Drivers/NRF24L01/%.c Drivers/NRF24L01/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L476xx -c -I../Drivers/VL53L0X -I../Drivers/NRF24L01 -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-NRF24L01

clean-Drivers-2f-NRF24L01:
	-$(RM) ./Drivers/NRF24L01/nrf24.d ./Drivers/NRF24L01/nrf24.o ./Drivers/NRF24L01/nrf24.su

.PHONY: clean-Drivers-2f-NRF24L01

