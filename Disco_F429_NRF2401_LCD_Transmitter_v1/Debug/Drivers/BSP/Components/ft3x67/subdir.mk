################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/BSP/Components/ft3x67/ft3x67.c 

OBJS += \
./Drivers/BSP/Components/ft3x67/ft3x67.o 

C_DEPS += \
./Drivers/BSP/Components/ft3x67/ft3x67.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/Components/ft3x67/%.o Drivers/BSP/Components/ft3x67/%.su Drivers/BSP/Components/ft3x67/%.cyclo: ../Drivers/BSP/Components/ft3x67/%.c Drivers/BSP/Components/ft3x67/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -c -I../Core/Inc -I../Drivers/NRF24L01 -I../Drivers/BSP/STM32F429I-Discovery -I../Drivers/BSP/Components -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-Components-2f-ft3x67

clean-Drivers-2f-BSP-2f-Components-2f-ft3x67:
	-$(RM) ./Drivers/BSP/Components/ft3x67/ft3x67.cyclo ./Drivers/BSP/Components/ft3x67/ft3x67.d ./Drivers/BSP/Components/ft3x67/ft3x67.o ./Drivers/BSP/Components/ft3x67/ft3x67.su

.PHONY: clean-Drivers-2f-BSP-2f-Components-2f-ft3x67

