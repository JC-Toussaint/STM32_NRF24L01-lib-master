################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Startup/startup_stm32l432kcux.s 

OBJS += \
./Startup/startup_stm32l432kcux.o 

S_DEPS += \
./Startup/startup_stm32l432kcux.d 


# Each subdirectory must supply rules for building sources it contributes
Startup/startup_stm32l432kcux.o: ../Startup/startup_stm32l432kcux.s
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -c -x assembler-with-cpp -MMD -MP -MF"Startup/startup_stm32l432kcux.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

