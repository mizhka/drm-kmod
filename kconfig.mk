# CONFIG_DRM*
KCONFIG=	DRM_AMDGPU_CIK \
		DRM_AMDGPU_SI \
		DRM_AMD_DC \
		DRM_AMD_DC_FBC \
		DRM_AMD_POWERPLAY \
		DRM_I915_ALPHA_SUPPORT \
		DRM_I915_FORCE_PROBE='"*"' \
		DRM_I915_CAPTURE_ERROR \
		DRM_I915_SPIN_REQUEST=5 \
		DRM_I915_USERFAULT_AUTOSUSPEND=250 \
		DRM_I915_STOP_TIMEOUT=100 \
		DRM_LOAD_EDID_FIRMWARE \
		DRM_MIPI_DSI \
		DRM_PANEL_ORIENTATION_QUIRKS \
		DRM_VMWGFX_FBCON

.if empty(NO_FBDEV)
KCONFIG+=	DRM_FBDEV_EMULATION \
		DRM_FBDEV_OVERALLOC=100
.endif

.if empty(NO_LEGACY)
KCONFIG+=	DRM_LEGACY \
		DRM_VM
.endif

# non arch specific kconfig
KCONFIG+=	ARCH_HAVE_NMI_SAFE_CMPXCHG \
		BACKLIGHT_CLASS_DEVICE \
		DMI \
		FB \
		MTRR \
		PCI \
		PM \
		SMP

.if ${MACHINE_CPUARCH} == "aarch64"
KCONFIG+=	ACPI \
		ARM64
.endif

.if ${MACHINE_CPUARCH} == "i386" || ${MACHINE_CPUARCH} == "amd64"
KCONFIG+=	ACPI \
		ACPI_SLEEP \
		AGP \
		X86 \
		X86_PAT

.if ${MACHINE_CPUARCH} == "amd64"
KCONFIG+=	64BIT \
		AS_MOVNTDQA \
		COMPAT \
		X64_64

KCONFIG+=	DRM_AMD_DC_DCN1_0 \
		DRM_AMD_DC_DCN1_01 \
		DRM_AMD_DC_DCN2_0 \
		DRM_AMD_DC_DCN2_1 \
		DRM_AMD_DC_DSC_SUPPORT
.endif
.endif

.if ${MACHINE_CPUARCH} == "powerpc64"
KCONFIG+=	64BIT \
		PPC64
.endif
