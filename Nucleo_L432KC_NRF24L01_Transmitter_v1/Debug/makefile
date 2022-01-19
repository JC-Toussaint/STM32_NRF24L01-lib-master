################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Startup/subdir.mk
-include Src/subdir.mk
-include Drivers/STM32L4xx_HAL_Driver/Src/subdir.mk
-include Drivers/NRF24L01/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
Nucleo_L432KC_NRF24L01_Transmitter_v1.elf \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
Nucleo_L432KC_NRF24L01_Transmitter_v1.list \

OBJCOPY_BIN += \
Nucleo_L432KC_NRF24L01_Transmitter_v1.bin \


# All Target
all: Nucleo_L432KC_NRF24L01_Transmitter_v1.elf secondary-outputs

# Tool invocations
Nucleo_L432KC_NRF24L01_Transmitter_v1.elf: $(OBJS) $(USER_OBJS) C:\Users\toussaij\Documents\STM32\STM32_NRF24L01-lib-master\Nucleo_L432KC_NRF24L01_Transmitter_v1\STM32L432KCUX_FLASH.ld
	arm-none-eabi-gcc -o "Nucleo_L432KC_NRF24L01_Transmitter_v1.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m4 -T"C:\Users\toussaij\Documents\STM32\STM32_NRF24L01-lib-master\Nucleo_L432KC_NRF24L01_Transmitter_v1\STM32L432KCUX_FLASH.ld" --specs=nosys.specs -Wl,-Map="Nucleo_L432KC_NRF24L01_Transmitter_v1.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

Nucleo_L432KC_NRF24L01_Transmitter_v1.list: $(EXECUTABLES)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "Nucleo_L432KC_NRF24L01_Transmitter_v1.list"
	@echo 'Finished building: $@'
	@echo ' '

Nucleo_L432KC_NRF24L01_Transmitter_v1.bin: $(EXECUTABLES)
	arm-none-eabi-objcopy  -O binary $(EXECUTABLES) "Nucleo_L432KC_NRF24L01_Transmitter_v1.bin"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) *
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST) $(OBJCOPY_BIN)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
