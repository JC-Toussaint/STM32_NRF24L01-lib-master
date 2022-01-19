################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/BSP/Adafruit_Shield/stm32_adafruit_lcd.c \
../Drivers/BSP/Adafruit_Shield/stm32_adafruit_sd.c 

OBJS += \
./Drivers/BSP/Adafruit_Shield/stm32_adafruit_lcd.o \
./Drivers/BSP/Adafruit_Shield/stm32_adafruit_sd.o 

C_DEPS += \
./Drivers/BSP/Adafruit_Shield/stm32_adafruit_lcd.d \
./Drivers/BSP/Adafruit_Shield/stm32_adafruit_sd.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/Adafruit_Shield/stm32_adafruit_lcd.o: ../Drivers/BSP/Adafruit_Shield/stm32_adafruit_lcd.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F411xE -DDEBUG -c -I../Core/Inc -I../Drivers/BSP/Adafruit_Shield -I../Drivers/BSP/STM32F4xx-Nucleo -I../Drivers/NRF24L01 -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/BSP/Adafruit_Shield/stm32_adafruit_lcd.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Drivers/BSP/Adafruit_Shield/stm32_adafruit_sd.o: ../Drivers/BSP/Adafruit_Shield/stm32_adafruit_sd.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F411xE -DDEBUG -c -I../Core/Inc -I../Drivers/BSP/Adafruit_Shield -I../Drivers/BSP/STM32F4xx-Nucleo -I../Drivers/NRF24L01 -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/BSP/Adafruit_Shield/stm32_adafruit_sd.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

