################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/VL53L0X/vl53l0x_class.c 

OBJS += \
./Drivers/VL53L0X/vl53l0x_class.o 

C_DEPS += \
./Drivers/VL53L0X/vl53l0x_class.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/VL53L0X/%.o Drivers/VL53L0X/%.su: ../Drivers/VL53L0X/%.c Drivers/VL53L0X/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L476xx -c -I../Drivers/VL53L0X -I../Drivers/NRF24L01 -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-VL53L0X

clean-Drivers-2f-VL53L0X:
	-$(RM) ./Drivers/VL53L0X/vl53l0x_class.d ./Drivers/VL53L0X/vl53l0x_class.o ./Drivers/VL53L0X/vl53l0x_class.su

.PHONY: clean-Drivers-2f-VL53L0X

