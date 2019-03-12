;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Thu Mar 07 10:38:53 2019
;--------------------------------------------------------
$name PCA
$optc51 --model-small
$printf_float
	R_DSEG    segment data
	R_CSEG    segment code
	R_BSEG    segment bit
	R_XSEG    segment xdata
	R_PSEG    segment xdata
	R_ISEG    segment idata
	R_OSEG    segment data overlay
	BIT_BANK  segment data overlay
	R_HOME    segment code
	R_GSINIT  segment code
	R_IXSEG   segment xdata
	R_CONST   segment code
	R_XINIT   segment code
	R_DINIT   segment code

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	public _main
	public _windSensorRead
	public _SPIWrite
	public _ConfigurePins
	public _ConfigPCA0
	public _Volts_at_Pin
	public _ADC_at_Pin
	public _InitADC
	public _delay_ms
	public _Timer3_ISR
	public _Timer2_ISR
	public __c51_external_startup
	public _spiBytes
	public _spiByteNum
	public _windAngle
	public _totalSteps
	public _interruptCount
	public _stepCount
	public _delayFlag
	public _direction
	public _adcFlag
;--------------------------------------------------------
; Special Function Registers
;--------------------------------------------------------
_ACC            DATA 0xe0
_ADC0ASAH       DATA 0xb6
_ADC0ASAL       DATA 0xb5
_ADC0ASCF       DATA 0xa1
_ADC0ASCT       DATA 0xc7
_ADC0CF0        DATA 0xbc
_ADC0CF1        DATA 0xb9
_ADC0CF2        DATA 0xdf
_ADC0CN0        DATA 0xe8
_ADC0CN1        DATA 0xb2
_ADC0CN2        DATA 0xb3
_ADC0GTH        DATA 0xc4
_ADC0GTL        DATA 0xc3
_ADC0H          DATA 0xbe
_ADC0L          DATA 0xbd
_ADC0LTH        DATA 0xc6
_ADC0LTL        DATA 0xc5
_ADC0MX         DATA 0xbb
_B              DATA 0xf0
_CKCON0         DATA 0x8e
_CKCON1         DATA 0xa6
_CLEN0          DATA 0xc6
_CLIE0          DATA 0xc7
_CLIF0          DATA 0xe8
_CLKSEL         DATA 0xa9
_CLOUT0         DATA 0xd1
_CLU0CF         DATA 0xb1
_CLU0FN         DATA 0xaf
_CLU0MX         DATA 0x84
_CLU1CF         DATA 0xb3
_CLU1FN         DATA 0xb2
_CLU1MX         DATA 0x85
_CLU2CF         DATA 0xb6
_CLU2FN         DATA 0xb5
_CLU2MX         DATA 0x91
_CLU3CF         DATA 0xbf
_CLU3FN         DATA 0xbe
_CLU3MX         DATA 0xae
_CMP0CN0        DATA 0x9b
_CMP0CN1        DATA 0x99
_CMP0MD         DATA 0x9d
_CMP0MX         DATA 0x9f
_CMP1CN0        DATA 0xbf
_CMP1CN1        DATA 0xac
_CMP1MD         DATA 0xab
_CMP1MX         DATA 0xaa
_CRC0CN0        DATA 0xce
_CRC0CN1        DATA 0x86
_CRC0CNT        DATA 0xd3
_CRC0DAT        DATA 0xcb
_CRC0FLIP       DATA 0xcf
_CRC0IN         DATA 0xca
_CRC0ST         DATA 0xd2
_DAC0CF0        DATA 0x91
_DAC0CF1        DATA 0x92
_DAC0H          DATA 0x85
_DAC0L          DATA 0x84
_DAC1CF0        DATA 0x93
_DAC1CF1        DATA 0x94
_DAC1H          DATA 0x8a
_DAC1L          DATA 0x89
_DAC2CF0        DATA 0x95
_DAC2CF1        DATA 0x96
_DAC2H          DATA 0x8c
_DAC2L          DATA 0x8b
_DAC3CF0        DATA 0x9a
_DAC3CF1        DATA 0x9c
_DAC3H          DATA 0x8e
_DAC3L          DATA 0x8d
_DACGCF0        DATA 0x88
_DACGCF1        DATA 0x98
_DACGCF2        DATA 0xa2
_DERIVID        DATA 0xad
_DEVICEID       DATA 0xb5
_DPH            DATA 0x83
_DPL            DATA 0x82
_EIE1           DATA 0xe6
_EIE2           DATA 0xf3
_EIP1           DATA 0xbb
_EIP1H          DATA 0xee
_EIP2           DATA 0xed
_EIP2H          DATA 0xf6
_EMI0CN         DATA 0xe7
_FLKEY          DATA 0xb7
_HFO0CAL        DATA 0xc7
_HFO1CAL        DATA 0xd6
_HFOCN          DATA 0xef
_I2C0ADM        DATA 0xff
_I2C0CN0        DATA 0xba
_I2C0DIN        DATA 0xbc
_I2C0DOUT       DATA 0xbb
_I2C0FCN0       DATA 0xad
_I2C0FCN1       DATA 0xab
_I2C0FCT        DATA 0xf5
_I2C0SLAD       DATA 0xbd
_I2C0STAT       DATA 0xb9
_IE             DATA 0xa8
_IP             DATA 0xb8
_IPH            DATA 0xf2
_IT01CF         DATA 0xe4
_LFO0CN         DATA 0xb1
_P0             DATA 0x80
_P0MASK         DATA 0xfe
_P0MAT          DATA 0xfd
_P0MDIN         DATA 0xf1
_P0MDOUT        DATA 0xa4
_P0SKIP         DATA 0xd4
_P1             DATA 0x90
_P1MASK         DATA 0xee
_P1MAT          DATA 0xed
_P1MDIN         DATA 0xf2
_P1MDOUT        DATA 0xa5
_P1SKIP         DATA 0xd5
_P2             DATA 0xa0
_P2MASK         DATA 0xfc
_P2MAT          DATA 0xfb
_P2MDIN         DATA 0xf3
_P2MDOUT        DATA 0xa6
_P2SKIP         DATA 0xcc
_P3             DATA 0xb0
_P3MDIN         DATA 0xf4
_P3MDOUT        DATA 0x9c
_PCA0CENT       DATA 0x9e
_PCA0CLR        DATA 0x9c
_PCA0CN0        DATA 0xd8
_PCA0CPH0       DATA 0xfc
_PCA0CPH1       DATA 0xea
_PCA0CPH2       DATA 0xec
_PCA0CPH3       DATA 0xf5
_PCA0CPH4       DATA 0x85
_PCA0CPH5       DATA 0xde
_PCA0CPL0       DATA 0xfb
_PCA0CPL1       DATA 0xe9
_PCA0CPL2       DATA 0xeb
_PCA0CPL3       DATA 0xf4
_PCA0CPL4       DATA 0x84
_PCA0CPL5       DATA 0xdd
_PCA0CPM0       DATA 0xda
_PCA0CPM1       DATA 0xdb
_PCA0CPM2       DATA 0xdc
_PCA0CPM3       DATA 0xae
_PCA0CPM4       DATA 0xaf
_PCA0CPM5       DATA 0xcc
_PCA0H          DATA 0xfa
_PCA0L          DATA 0xf9
_PCA0MD         DATA 0xd9
_PCA0POL        DATA 0x96
_PCA0PWM        DATA 0xf7
_PCON0          DATA 0x87
_PCON1          DATA 0xcd
_PFE0CN         DATA 0xc1
_PRTDRV         DATA 0xf6
_PSCTL          DATA 0x8f
_PSTAT0         DATA 0xaa
_PSW            DATA 0xd0
_REF0CN         DATA 0xd1
_REG0CN         DATA 0xc9
_REVID          DATA 0xb6
_RSTSRC         DATA 0xef
_SBCON1         DATA 0x94
_SBRLH1         DATA 0x96
_SBRLL1         DATA 0x95
_SBUF           DATA 0x99
_SBUF0          DATA 0x99
_SBUF1          DATA 0x92
_SCON           DATA 0x98
_SCON0          DATA 0x98
_SCON1          DATA 0xc8
_SFRPAGE        DATA 0xa7
_SFRPGCN        DATA 0xbc
_SFRSTACK       DATA 0xd7
_SMB0ADM        DATA 0xd6
_SMB0ADR        DATA 0xd7
_SMB0CF         DATA 0xc1
_SMB0CN0        DATA 0xc0
_SMB0DAT        DATA 0xc2
_SMB0FCN0       DATA 0xc3
_SMB0FCN1       DATA 0xc4
_SMB0FCT        DATA 0xef
_SMB0RXLN       DATA 0xc5
_SMB0TC         DATA 0xac
_SMOD1          DATA 0x93
_SP             DATA 0x81
_SPI0CFG        DATA 0xa1
_SPI0CKR        DATA 0xa2
_SPI0CN0        DATA 0xf8
_SPI0DAT        DATA 0xa3
_SPI0FCN0       DATA 0x9a
_SPI0FCN1       DATA 0x9b
_SPI0FCT        DATA 0xf7
_SPI0PCF        DATA 0xdf
_TCON           DATA 0x88
_TH0            DATA 0x8c
_TH1            DATA 0x8d
_TL0            DATA 0x8a
_TL1            DATA 0x8b
_TMOD           DATA 0x89
_TMR2CN0        DATA 0xc8
_TMR2CN1        DATA 0xfd
_TMR2H          DATA 0xcf
_TMR2L          DATA 0xce
_TMR2RLH        DATA 0xcb
_TMR2RLL        DATA 0xca
_TMR3CN0        DATA 0x91
_TMR3CN1        DATA 0xfe
_TMR3H          DATA 0x95
_TMR3L          DATA 0x94
_TMR3RLH        DATA 0x93
_TMR3RLL        DATA 0x92
_TMR4CN0        DATA 0x98
_TMR4CN1        DATA 0xff
_TMR4H          DATA 0xa5
_TMR4L          DATA 0xa4
_TMR4RLH        DATA 0xa3
_TMR4RLL        DATA 0xa2
_TMR5CN0        DATA 0xc0
_TMR5CN1        DATA 0xf1
_TMR5H          DATA 0xd5
_TMR5L          DATA 0xd4
_TMR5RLH        DATA 0xd3
_TMR5RLL        DATA 0xd2
_UART0PCF       DATA 0xd9
_UART1FCN0      DATA 0x9d
_UART1FCN1      DATA 0xd8
_UART1FCT       DATA 0xfa
_UART1LIN       DATA 0x9e
_UART1PCF       DATA 0xda
_VDM0CN         DATA 0xff
_WDTCN          DATA 0x97
_XBR0           DATA 0xe1
_XBR1           DATA 0xe2
_XBR2           DATA 0xe3
_XOSC0CN        DATA 0x86
_DPTR           DATA 0x8382
_TMR2RL         DATA 0xcbca
_TMR3RL         DATA 0x9392
_TMR4RL         DATA 0xa3a2
_TMR5RL         DATA 0xd3d2
_TMR0           DATA 0x8c8a
_TMR1           DATA 0x8d8b
_TMR2           DATA 0xcfce
_TMR3           DATA 0x9594
_TMR4           DATA 0xa5a4
_TMR5           DATA 0xd5d4
_SBRL1          DATA 0x9695
_PCA0           DATA 0xfaf9
_PCA0CP0        DATA 0xfcfb
_PCA0CP1        DATA 0xeae9
_PCA0CP2        DATA 0xeceb
_PCA0CP3        DATA 0xf5f4
_PCA0CP4        DATA 0x8584
_PCA0CP5        DATA 0xdedd
_ADC0ASA        DATA 0xb6b5
_ADC0GT         DATA 0xc4c3
_ADC0           DATA 0xbebd
_ADC0LT         DATA 0xc6c5
_DAC0           DATA 0x8584
_DAC1           DATA 0x8a89
_DAC2           DATA 0x8c8b
_DAC3           DATA 0x8e8d
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
_ACC_0          BIT 0xe0
_ACC_1          BIT 0xe1
_ACC_2          BIT 0xe2
_ACC_3          BIT 0xe3
_ACC_4          BIT 0xe4
_ACC_5          BIT 0xe5
_ACC_6          BIT 0xe6
_ACC_7          BIT 0xe7
_TEMPE          BIT 0xe8
_ADGN0          BIT 0xe9
_ADGN1          BIT 0xea
_ADWINT         BIT 0xeb
_ADBUSY         BIT 0xec
_ADINT          BIT 0xed
_IPOEN          BIT 0xee
_ADEN           BIT 0xef
_B_0            BIT 0xf0
_B_1            BIT 0xf1
_B_2            BIT 0xf2
_B_3            BIT 0xf3
_B_4            BIT 0xf4
_B_5            BIT 0xf5
_B_6            BIT 0xf6
_B_7            BIT 0xf7
_C0FIF          BIT 0xe8
_C0RIF          BIT 0xe9
_C1FIF          BIT 0xea
_C1RIF          BIT 0xeb
_C2FIF          BIT 0xec
_C2RIF          BIT 0xed
_C3FIF          BIT 0xee
_C3RIF          BIT 0xef
_D1SRC0         BIT 0x88
_D1SRC1         BIT 0x89
_D1AMEN         BIT 0x8a
_D01REFSL       BIT 0x8b
_D3SRC0         BIT 0x8c
_D3SRC1         BIT 0x8d
_D3AMEN         BIT 0x8e
_D23REFSL       BIT 0x8f
_D0UDIS         BIT 0x98
_D1UDIS         BIT 0x99
_D2UDIS         BIT 0x9a
_D3UDIS         BIT 0x9b
_EX0            BIT 0xa8
_ET0            BIT 0xa9
_EX1            BIT 0xaa
_ET1            BIT 0xab
_ES0            BIT 0xac
_ET2            BIT 0xad
_ESPI0          BIT 0xae
_EA             BIT 0xaf
_PX0            BIT 0xb8
_PT0            BIT 0xb9
_PX1            BIT 0xba
_PT1            BIT 0xbb
_PS0            BIT 0xbc
_PT2            BIT 0xbd
_PSPI0          BIT 0xbe
_P0_0           BIT 0x80
_P0_1           BIT 0x81
_P0_2           BIT 0x82
_P0_3           BIT 0x83
_P0_4           BIT 0x84
_P0_5           BIT 0x85
_P0_6           BIT 0x86
_P0_7           BIT 0x87
_P1_0           BIT 0x90
_P1_1           BIT 0x91
_P1_2           BIT 0x92
_P1_3           BIT 0x93
_P1_4           BIT 0x94
_P1_5           BIT 0x95
_P1_6           BIT 0x96
_P1_7           BIT 0x97
_P2_0           BIT 0xa0
_P2_1           BIT 0xa1
_P2_2           BIT 0xa2
_P2_3           BIT 0xa3
_P2_4           BIT 0xa4
_P2_5           BIT 0xa5
_P2_6           BIT 0xa6
_P3_0           BIT 0xb0
_P3_1           BIT 0xb1
_P3_2           BIT 0xb2
_P3_3           BIT 0xb3
_P3_4           BIT 0xb4
_P3_7           BIT 0xb7
_CCF0           BIT 0xd8
_CCF1           BIT 0xd9
_CCF2           BIT 0xda
_CCF3           BIT 0xdb
_CCF4           BIT 0xdc
_CCF5           BIT 0xdd
_CR             BIT 0xde
_CF             BIT 0xdf
_PARITY         BIT 0xd0
_F1             BIT 0xd1
_OV             BIT 0xd2
_RS0            BIT 0xd3
_RS1            BIT 0xd4
_F0             BIT 0xd5
_AC             BIT 0xd6
_CY             BIT 0xd7
_RI             BIT 0x98
_TI             BIT 0x99
_RB8            BIT 0x9a
_TB8            BIT 0x9b
_REN            BIT 0x9c
_CE             BIT 0x9d
_SMODE          BIT 0x9e
_RI1            BIT 0xc8
_TI1            BIT 0xc9
_RBX1           BIT 0xca
_TBX1           BIT 0xcb
_REN1           BIT 0xcc
_PERR1          BIT 0xcd
_OVR1           BIT 0xce
_SI             BIT 0xc0
_ACK            BIT 0xc1
_ARBLOST        BIT 0xc2
_ACKRQ          BIT 0xc3
_STO            BIT 0xc4
_STA            BIT 0xc5
_TXMODE         BIT 0xc6
_MASTER         BIT 0xc7
_SPIEN          BIT 0xf8
_TXNF           BIT 0xf9
_NSSMD0         BIT 0xfa
_NSSMD1         BIT 0xfb
_RXOVRN         BIT 0xfc
_MODF           BIT 0xfd
_WCOL           BIT 0xfe
_SPIF           BIT 0xff
_IT0            BIT 0x88
_IE0            BIT 0x89
_IT1            BIT 0x8a
_IE1            BIT 0x8b
_TR0            BIT 0x8c
_TF0            BIT 0x8d
_TR1            BIT 0x8e
_TF1            BIT 0x8f
_T2XCLK0        BIT 0xc8
_T2XCLK1        BIT 0xc9
_TR2            BIT 0xca
_T2SPLIT        BIT 0xcb
_TF2CEN         BIT 0xcc
_TF2LEN         BIT 0xcd
_TF2L           BIT 0xce
_TF2H           BIT 0xcf
_T4XCLK0        BIT 0x98
_T4XCLK1        BIT 0x99
_TR4            BIT 0x9a
_T4SPLIT        BIT 0x9b
_TF4CEN         BIT 0x9c
_TF4LEN         BIT 0x9d
_TF4L           BIT 0x9e
_TF4H           BIT 0x9f
_T5XCLK0        BIT 0xc0
_T5XCLK1        BIT 0xc1
_TR5            BIT 0xc2
_T5SPLIT        BIT 0xc3
_TF5CEN         BIT 0xc4
_TF5LEN         BIT 0xc5
_TF5L           BIT 0xc6
_TF5H           BIT 0xc7
_RIE            BIT 0xd8
_RXTO0          BIT 0xd9
_RXTO1          BIT 0xda
_RFRQ           BIT 0xdb
_TIE            BIT 0xdc
_TXHOLD         BIT 0xdd
_TXNF1          BIT 0xde
_TFRQ           BIT 0xdf
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	rbank0 segment data overlay
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_adcFlag:
	ds 1
_direction:
	ds 1
_delayFlag:
	ds 1
_stepCount:
	ds 1
_interruptCount:
	ds 1
_totalSteps:
	ds 2
_windAngle:
	ds 2
_spiByteNum:
	ds 1
_spiBytes:
	ds 10
_main_vReadings_1_80:
	ds 8
_main_voltages_1_80:
	ds 8
_main_measureCount_1_80:
	ds 2
_main_sloc0_1_0:
	ds 4
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
	rseg	R_OSEG
	rseg	R_OSEG
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	rseg R_ISEG
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	DSEG
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	rseg R_BSEG
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_PSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	XSEG
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	rseg R_IXSEG
	rseg R_HOME
	rseg R_GSINIT
	rseg R_CSEG
;--------------------------------------------------------
; Reset entry point and interrupt vectors
;--------------------------------------------------------
	CSEG at 0x0000
	ljmp	_crt0
	CSEG at 0x002b
	ljmp	_Timer2_ISR
	CSEG at 0x0073
	ljmp	_Timer3_ISR
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	rseg R_HOME
	rseg R_GSINIT
	rseg R_GSINIT
;--------------------------------------------------------
; data variables initialization
;--------------------------------------------------------
	rseg R_DINIT
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:47: volatile unsigned char adcFlag = 1;
	mov	_adcFlag,#0x01
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:48: volatile unsigned char direction = 1;
	mov	_direction,#0x01
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:50: volatile unsigned char delayFlag = 0;
	mov	_delayFlag,#0x00
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:53: volatile unsigned char stepCount = 0;
	mov	_stepCount,#0x00
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:54: volatile unsigned char interruptCount = 0;
	mov	_interruptCount,#0x00
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:57: int totalSteps = 0;
	clr	a
	mov	_totalSteps,a
	mov	(_totalSteps + 1),a
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:61: unsigned char spiByteNum = 0;
	mov	_spiByteNum,#0x00
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:64: char _c51_external_startup (void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:67: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:68: WDTCN = 0xDE; //First key
	mov	_WDTCN,#0xDE
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:69: WDTCN = 0xAD; //Second key
	mov	_WDTCN,#0xAD
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:71: VDM0CN=0x80;       // enable VDD monitor
	mov	_VDM0CN,#0x80
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:72: RSTSRC=0x02|0x04;  // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:79: SFRPAGE = 0x10;
	mov	_SFRPAGE,#0x10
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:80: PFE0CN  = 0x20; // SYSCLK < 75 MHz.
	mov	_PFE0CN,#0x20
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:81: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:102: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:103: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:104: while ((CLKSEL & 0x80) == 0);
L002001?:
	mov	a,_CLKSEL
	jnb	acc.7,L002001?
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:105: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:106: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:107: while ((CLKSEL & 0x80) == 0);
L002004?:
	mov	a,_CLKSEL
	jnb	acc.7,L002004?
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:112: P0MDOUT |= 0x10; // Enable UART0 TX as push-pull output
	orl	_P0MDOUT,#0x10
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:115: XBR0     = 0x03; // Enable SPI0 and UART0 on P0.4(TX) and P0.5(RX)  
	mov	_XBR0,#0x03
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:117: XBR1     = 0X01; //Enable PCA I/O and route CEX0 only (check reference manual page 120)
	mov	_XBR1,#0x01
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:119: XBR2     = 0x40; // Enable crossbar and weak pull-ups
	mov	_XBR2,#0x40
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:121: P0SKIP |= 0b_1100_1111; //Skip all P0 bits except bits 4 and 5 (UART0)
	orl	_P0SKIP,#0xCF
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:128: P1SKIP |= 0b_0000_1111; 
	orl	_P1SKIP,#0x0F
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:134: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:135: TH1 = 0x100-((SYSCLK/BAUDRATE)/(2L*12L));
	mov	_TH1,#0xE6
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:136: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:137: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	anl	_TMOD,#0x0F
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:138: TMOD |=  0x20;                       
	orl	_TMOD,#0x20
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:139: TR1 = 1; // START Timer1
	setb	_TR1
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:140: TI = 1;  // Indicate TX0 ready
	setb	_TI
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:143: SPI0CKR = (SYSCLK/(2*F_SCK_MAX))-1;
	mov	_SPI0CKR,#0x59
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:144: SPI0CFG = 0b_0110_0000; //SPI in master mode (CKPHA = 1, CKPOL = 0)
	mov	_SPI0CFG,#0x60
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:145: SPI0CN0 = 0b_0000_0001; //SPI enabled and in 3 wire master mode
	mov	_SPI0CN0,#0x01
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:148: TMR2CN0=0x00;   // Stop Timer2; Clear TF2;
	mov	_TMR2CN0,#0x00
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:149: CKCON0|=0b_0001_0000; // Timer 2 uses the system clock
	orl	_CKCON0,#0x10
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:150: TMR2RL=(0x10000L-(SYSCLK/(2*TIMER_2_FREQ))); // Initialize reload value
	mov	_TMR2RL,#0x60
	mov	(_TMR2RL >> 8),#0x73
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:151: TMR2=0xffff;   // Set to reload immediately
	mov	_TMR2,#0xFF
	mov	(_TMR2 >> 8),#0xFF
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:152: ET2=1;         // Enable Timer2 interrupts
	setb	_ET2
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:153: TR2=1;         // Start Timer2 (TMR2CN is bit addressable)
	setb	_TR2
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:156: TMR3CN0=0x00;   // Stop Timer3; Clear TF3;
	mov	_TMR3CN0,#0x00
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:157: CKCON0|=0b_0100_0000; // Timer 3 uses the system clock
	orl	_CKCON0,#0x40
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:158: TMR3RL=(0x10000L-(SYSCLK/(2*TIMER_3_FREQ))); // Initialize reload value
	mov	_TMR3RL,#0xB0
	mov	(_TMR3RL >> 8),#0xB9
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:159: TMR3=0xffff;   // Set to reload immediately
	mov	_TMR3,#0xFF
	mov	(_TMR3 >> 8),#0xFF
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:160: EIE1|=0b_1000_0000;     // Enable Timer3 interrupts
	orl	_EIE1,#0x80
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:161: TMR3CN0|=0b_0000_0100;  // Start Timer3 (TMR3CN0 is not bit addressable)
	orl	_TMR3CN0,#0x04
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:163: EA=1; // Enable interrupts
	setb	_EA
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:165: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer2_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:169: void Timer2_ISR (void) interrupt INTERRUPT_TIMER2
;	-----------------------------------------
;	 function Timer2_ISR
;	-----------------------------------------
_Timer2_ISR:
	push	acc
	push	psw
	mov	psw,#0x00
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:171: SFRPAGE=0x0;
	mov	_SFRPAGE,#0x00
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:172: TF2H = 0; // Clear Timer2 interrupt flag
	clr	_TF2H
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:177: if(interruptCount == 3)
	mov	a,#0x03
	cjne	a,_interruptCount,L003038?
	sjmp	L003039?
L003038?:
	ljmp	L003025?
L003039?:
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:179: interruptCount = 0;
	mov	_interruptCount,#0x00
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:180: if(direction == 1)
	mov	a,#0x01
	cjne	a,_direction,L003020?
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:182: if(stepCount == 0)
	mov	a,_stepCount
	jnz	L003008?
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:184: PORT1 = 1;
	setb	_P2_1
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:185: PORT2 = 1;
	setb	_P2_2
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:186: PORT3 = 0;
	clr	_P2_3
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:187: PORT4 = 0;
	clr	_P2_4
	sjmp	L003021?
L003008?:
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:189: else if(stepCount == 1)
	mov	a,#0x01
	cjne	a,_stepCount,L003005?
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:191: PORT1 = 0;
	clr	_P2_1
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:192: PORT2 = 1;
	setb	_P2_2
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:193: PORT3 = 1;
	setb	_P2_3
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:194: PORT4 = 0;
	clr	_P2_4
	sjmp	L003021?
L003005?:
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:196: else if(stepCount == 2)
	mov	a,#0x02
	cjne	a,_stepCount,L003002?
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:198: PORT1 = 0;
	clr	_P2_1
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:199: PORT2 = 0;
	clr	_P2_2
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:200: PORT3 = 1;
	setb	_P2_3
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:201: PORT4 = 1;
	setb	_P2_4
	sjmp	L003021?
L003002?:
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:205: PORT1 = 1;
	setb	_P2_1
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:206: PORT2 = 0;
	clr	_P2_2
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:207: PORT3 = 0;
	clr	_P2_3
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:208: PORT4 = 1;
	setb	_P2_4
	sjmp	L003021?
L003020?:
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:213: if(stepCount == 0)
	mov	a,_stepCount
	jnz	L003017?
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:215: PORT1 = 1;
	setb	_P2_1
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:216: PORT2 = 0;
	clr	_P2_2
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:217: PORT3 = 0;
	clr	_P2_3
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:218: PORT4 = 1;
	setb	_P2_4
	sjmp	L003021?
L003017?:
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:220: else if(stepCount == 1)
	mov	a,#0x01
	cjne	a,_stepCount,L003014?
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:222: PORT1 = 0;
	clr	_P2_1
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:223: PORT2 = 0;
	clr	_P2_2
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:224: PORT3 = 1;
	setb	_P2_3
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:225: PORT4 = 1;
	setb	_P2_4
	sjmp	L003021?
L003014?:
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:227: else if(stepCount == 2)
	mov	a,#0x02
	cjne	a,_stepCount,L003011?
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:229: PORT1 = 0;
	clr	_P2_1
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:230: PORT2 = 1;
	setb	_P2_2
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:231: PORT3 = 1;
	setb	_P2_3
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:232: PORT4 = 0;
	clr	_P2_4
	sjmp	L003021?
L003011?:
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:236: PORT1 = 1;
	setb	_P2_1
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:237: PORT2 = 1;
	setb	_P2_2
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:238: PORT3 = 0;
	clr	_P2_3
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:239: PORT4 = 1;
	setb	_P2_4
L003021?:
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:245: stepCount++;
	inc	_stepCount
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:246: totalSteps++;
	inc	_totalSteps
	clr	a
	cjne	a,_totalSteps,L003052?
	inc	(_totalSteps + 1)
L003052?:
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:247: if(stepCount > 3)
	mov	a,_stepCount
	add	a,#0xff - 0x03
	jnc	L003027?
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:248: stepCount = 0;
	mov	_stepCount,#0x00
	sjmp	L003027?
L003025?:
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:251: interruptCount++;
	inc	_interruptCount
L003027?:
	pop	psw
	pop	acc
	reti
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer3_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:255: void Timer3_ISR (void) interrupt INTERRUPT_TIMER3
;	-----------------------------------------
;	 function Timer3_ISR
;	-----------------------------------------
_Timer3_ISR:
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:257: SFRPAGE=0x0;
	mov	_SFRPAGE,#0x00
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:258: TMR3CN0&=0b_0011_1111; // Clear Timer3 interrupt flags
	anl	_TMR3CN0,#0x3F
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:260: adcFlag = 1;
	mov	_adcFlag,#0x01
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:261: delayFlag = 1;
	mov	_delayFlag,#0x01
	reti
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
;------------------------------------------------------------
;Allocation info for local variables in function 'delay_ms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;countms                   Allocated to registers r4 r5 
;------------------------------------------------------------
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:264: void delay_ms(int ms)
;	-----------------------------------------
;	 function delay_ms
;	-----------------------------------------
_delay_ms:
	mov	r2,dpl
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:268: while(countms < 2 * ms)
	mov	a,dph
	xch	a,r2
	add	a,acc
	xch	a,r2
	rlc	a
	mov	r3,a
	mov	r4,#0x00
	mov	r5,#0x00
L005003?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	xrl	a,#0x80
	mov	b,r3
	xrl	b,#0x80
	subb	a,b
	jnc	L005006?
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:270: if(delayFlag == 1)
	mov	a,#0x01
	cjne	a,_delayFlag,L005003?
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:272: delayFlag = 0;
	mov	_delayFlag,#0x00
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:273: countms++;
	inc	r4
	cjne	r4,#0x00,L005003?
	inc	r5
	sjmp	L005003?
L005006?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'InitADC'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:278: void InitADC (void)
;	-----------------------------------------
;	 function InitADC
;	-----------------------------------------
_InitADC:
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:280: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:281: ADC0CN1 = 0b_10_000_000; //14-bit,  Right justified no shifting applied, perform and Accumulate 1 conversion.
	mov	_ADC0CN1,#0x80
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:282: ADC0CF0 = 0b_11111_0_00; // SYSCLK/32
	mov	_ADC0CF0,#0xF8
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:283: ADC0CF1 = 0b_0_0_011110; // Same as default for now
	mov	_ADC0CF1,#0x1E
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:284: ADC0CN0 = 0b_0_0_0_0_0_00_0; // Same as default for now
	mov	_ADC0CN0,#0x00
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:285: ADC0CF2 = 0b_0_01_11111 ; // GND pin, Vref=VDD
	mov	_ADC0CF2,#0x3F
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:286: ADC0CN2 = 0b_0_000_0000;  // Same as default for now. ADC0 conversion initiated on write of 1 to ADBUSY.
	mov	_ADC0CN2,#0x00
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:287: ADEN=1; // Enable ADC
	setb	_ADEN
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ADC_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers 
;------------------------------------------------------------
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:290: unsigned int ADC_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function ADC_at_Pin
;	-----------------------------------------
_ADC_at_Pin:
	mov	_ADC0MX,dpl
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:293: ADBUSY=1;       // Dummy conversion first to select new pin
	setb	_ADBUSY
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:294: while (ADBUSY); // Wait for dummy conversion to finish
L007001?:
	jb	_ADBUSY,L007001?
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:295: ADBUSY = 1;     // Convert voltage at the pin
	setb	_ADBUSY
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:296: while (ADBUSY); // Wait for conversion to complete
L007004?:
	jb	_ADBUSY,L007004?
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:297: return (ADC0);
	mov	dpl,_ADC0
	mov	dph,(_ADC0 >> 8)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Volts_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:300: float Volts_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function Volts_at_Pin
;	-----------------------------------------
_Volts_at_Pin:
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:302: return ((ADC_at_Pin(pin)*VDD)/16383.0);
	lcall	_ADC_at_Pin
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x9FBE
	mov	b,#0x52
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	mov	a,#0xFC
	push	acc
	mov	a,#0x7F
	push	acc
	mov	a,#0x46
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ConfigPCA0'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:305: void ConfigPCA0()
;	-----------------------------------------
;	 function ConfigPCA0
;	-----------------------------------------
_ConfigPCA0:
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:307: SFRPAGE = 0x00; //Navigate to SFR page for register write
	mov	_SFRPAGE,#0x00
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:309: PCA0POL = 0b_0000_0000; //Set the output polarity for all channels to default (no inversion)
	mov	_PCA0POL,#0x00
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:311: PCA0MD = 0b_0000_0000; //Set PCA mode to operate even in idle mode with SYSCLK/12
	mov	_PCA0MD,#0x00
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:312: PCA0PWM = 0b_0000_0000;	//Enable 8-bit PWM with no overflow flag set and no interrupts enabled
	mov	_PCA0PWM,#0x00
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:313: PCA0CLR = 0b_0000_0000; //Disable comparator clear for all modules
	mov	_PCA0CLR,#0x00
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:314: PCA0CENT = 0b_00_000000; //Set all modules to edge aligned mode (bits 6 and 7 are reserved and must be 00)
	mov	_PCA0CENT,#0x00
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:316: PCA0CN0 = 0b_0100_0000; //Start the PCA counter/timer (CR bit)	
	mov	_PCA0CN0,#0x40
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:319: PCA0CPM0 = 0b_0100_0010;//Configure Channel 0 to function in 8-bit PWM mode
	mov	_PCA0CPM0,#0x42
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:320: PCA0CPH0 = 128; //Load the PCA0CP0 high byte 
	mov	_PCA0CPH0,#0x80
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ConfigurePins'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:324: void ConfigurePins()
;	-----------------------------------------
;	 function ConfigurePins
;	-----------------------------------------
_ConfigurePins:
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:326: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:328: P0MDIN &= 0b_1111_1011; //Set P0 bit 2 to analog input for ADC
	anl	_P0MDIN,#0xFB
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:329: P1MDIN &= 0b_1111_0111; //Set P1 bit 3 to analog input for ADC
	anl	_P1MDIN,#0xF7
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:341: P1MDOUT |= 0b_1101_0000; 
	orl	_P1MDOUT,#0xD0
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:342: P2MDOUT |= 0b_0111_1111; 
	orl	_P2MDOUT,#0x7F
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:345: SFRPAGE = 0x00;	
	mov	_SFRPAGE,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SPIWrite'
;------------------------------------------------------------
;dat                       Allocated to registers 
;receive                   Allocated to registers 
;------------------------------------------------------------
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:348: unsigned char SPIWrite (unsigned char dat)
;	-----------------------------------------
;	 function SPIWrite
;	-----------------------------------------
_SPIWrite:
	mov	_SPI0DAT,dpl
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:353: while(!SPIF); //Wait for the transaction to be finished
L011001?:
	jnb	_SPIF,L011001?
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:354: receive = SPI0DAT;
	mov	dpl,_SPI0DAT
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:356: SPIF = 0; //Set the SPI flag back to 0 for next transaction
	clr	_SPIF
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:358: return receive;
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'windSensorRead'
;------------------------------------------------------------
;temp                      Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:361: void windSensorRead()
;	-----------------------------------------
;	 function windSensorRead
;	-----------------------------------------
_windSensorRead:
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:365: if(spiByteNum == 0)
	mov	a,_spiByteNum
	jnz	L012009?
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:367: MASTER_SS = 0; //Select the wind sensor
	clr	_P2_0
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:369: delay_ms(4); //Wait at least 1.5ms before continuing
	mov	dptr,#0x0004
	lcall	_delay_ms
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:370: spiBytes[spiByteNum] = SPIWrite(0xAA); //Write the start byte to the sensor and store the incoming byte
	mov	a,_spiByteNum
	add	a,#_spiBytes
	mov	r0,a
	mov	dpl,#0xAA
	push	ar0
	lcall	_SPIWrite
	mov	a,dpl
	pop	ar0
	mov	@r0,a
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:372: spiByteNum++;
	inc	_spiByteNum
	ret
L012009?:
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:376: if(spiByteNum < 10)
	mov	a,#0x100 - 0x0A
	add	a,_spiByteNum
	jc	L012006?
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:378: spiBytes[spiByteNum] = SPIWrite(0xFF); //Keep writing all-Hi to obtain reading from MISO
	mov	a,_spiByteNum
	add	a,#_spiBytes
	mov	r0,a
	mov	dpl,#0xFF
	push	ar0
	lcall	_SPIWrite
	mov	a,dpl
	pop	ar0
	mov	@r0,a
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:379: spiByteNum++;
	inc	_spiByteNum
	ret
L012006?:
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:383: MASTER_SS = 1; //Deselect the wind sensor
	setb	_P2_0
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:384: delay_ms(2);
	mov	dptr,#0x0002
	lcall	_delay_ms
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:386: spiByteNum = 0;
	mov	_spiByteNum,#0x00
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:388: if(spiBytes[3] & 1)
	mov	a,(_spiBytes + 0x0003)
	mov	r2,a
	jnb	acc.0,L012011?
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:390: temp = (spiBytes[2] << 8) + spiBytes[3];
	mov	r3,(_spiBytes + 0x0002)
	mov	ar4,r3
	clr	a
	mov	r3,a
	mov	r5,a
	mov	a,r2
	add	a,r3
	mov	r2,a
	mov	a,r5
	addc	a,r4
	mov	r3,a
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:392: if(temp < 0xFFFF)	//If the read angle is valid set it to the wind angle
	mov	ar4,r2
	mov	ar5,r3
	clr	c
	mov	a,r4
	subb	a,#0xFF
	mov	a,r5
	subb	a,#0xFF
	jnc	L012011?
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:393: windAngle = (temp >> 2);
	mov	_windAngle,r2
	mov	a,r3
	mov	c,acc.7
	rrc	a
	xch	a,_windAngle
	rrc	a
	xch	a,_windAngle
	mov	c,acc.7
	rrc	a
	xch	a,_windAngle
	rrc	a
	xch	a,_windAngle
	mov	(_windAngle + 1),a
L012011?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;vReadings                 Allocated with name '_main_vReadings_1_80'
;voltages                  Allocated with name '_main_voltages_1_80'
;measureCount              Allocated with name '_main_measureCount_1_80'
;totalMeasurements         Allocated to registers 
;errorConstant             Allocated to registers 
;readingADCCounter         Allocated to registers r4 r5 
;readingADCTotalInterrupts Allocated to registers 
;sloc0                     Allocated with name '_main_sloc0_1_0'
;------------------------------------------------------------
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:399: void main (void) 
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:407: int measureCount = 0;
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:412: int readingADCCounter = 0;
	clr	a
	mov	_main_measureCount_1_80,a
	mov	(_main_measureCount_1_80 + 1),a
	mov	r4,a
	mov	r5,a
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:416: printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
	push	ar4
	push	ar5
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:418: ConfigurePins();
	lcall	_ConfigurePins
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:420: ConfigPCA0();
	lcall	_ConfigPCA0
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:422: InitADC();
	lcall	_InitADC
	pop	ar5
	pop	ar4
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:424: while(1) //Main loop of the program begins here
L013010?:
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:428: if(adcFlag == 1)
	mov	a,#0x01
	cjne	a,_adcFlag,L013018?
	sjmp	L013019?
L013018?:
	ljmp	L013008?
L013019?:
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:431: adcFlag = 0;
	mov	_adcFlag,#0x00
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:434: if(readingADCCounter < readingADCTotalInterrupts)
	clr	c
	mov	a,r4
	subb	a,#0x1E
	mov	a,r5
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L013005?
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:435: readingADCCounter++;
	inc	r4
	cjne	r4,#0x00,L013021?
	inc	r5
L013021?:
	ljmp	L013008?
L013005?:
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:439: if(measureCount < totalMeasurements)
	clr	c
	mov	a,_main_measureCount_1_80
	subb	a,#0x14
	mov	a,(_main_measureCount_1_80 + 1)
	xrl	a,#0x80
	subb	a,#0x80
	jc	L013022?
	ljmp	L013002?
L013022?:
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:442: voltages[0] += Volts_at_Pin(QFP32_MUX_P1_3);
	mov	_main_sloc0_1_0,_main_voltages_1_80
	mov	(_main_sloc0_1_0 + 1),(_main_voltages_1_80 + 1)
	mov	(_main_sloc0_1_0 + 2),(_main_voltages_1_80 + 2)
	mov	(_main_sloc0_1_0 + 3),(_main_voltages_1_80 + 3)
	mov	dpl,#0x09
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r6,b
	mov	r7,a
	push	ar2
	push	ar3
	push	ar6
	push	ar7
	mov	dpl,_main_sloc0_1_0
	mov	dph,(_main_sloc0_1_0 + 1)
	mov	b,(_main_sloc0_1_0 + 2)
	mov	a,(_main_sloc0_1_0 + 3)
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	_main_voltages_1_80,r2
	mov	(_main_voltages_1_80 + 1),r3
	mov	(_main_voltages_1_80 + 2),r6
	mov	(_main_voltages_1_80 + 3),r7
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:443: voltages[1] += Volts_at_Pin(QFP32_MUX_P0_2);
	mov	_main_sloc0_1_0,(_main_voltages_1_80 + 0x0004)
	mov	(_main_sloc0_1_0 + 1),((_main_voltages_1_80 + 0x0004) + 1)
	mov	(_main_sloc0_1_0 + 2),((_main_voltages_1_80 + 0x0004) + 2)
	mov	(_main_sloc0_1_0 + 3),((_main_voltages_1_80 + 0x0004) + 3)
	mov	dpl,#0x01
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r6,b
	mov	r7,a
	push	ar2
	push	ar3
	push	ar6
	push	ar7
	mov	dpl,_main_sloc0_1_0
	mov	dph,(_main_sloc0_1_0 + 1)
	mov	b,(_main_sloc0_1_0 + 2)
	mov	a,(_main_sloc0_1_0 + 3)
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	(_main_voltages_1_80 + 0x0004),r2
	mov	((_main_voltages_1_80 + 0x0004) + 1),r3
	mov	((_main_voltages_1_80 + 0x0004) + 2),r6
	mov	((_main_voltages_1_80 + 0x0004) + 3),r7
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:446: measureCount++;
	inc	_main_measureCount_1_80
	clr	a
	cjne	a,_main_measureCount_1_80,L013023?
	inc	(_main_measureCount_1_80 + 1)
L013023?:
	ljmp	L013003?
L013002?:
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:451: vReadings[0] = (voltages[0]/totalMeasurements) - errorConstant;
	clr	a
	push	acc
	push	acc
	mov	a,#0xA0
	push	acc
	mov	a,#0x41
	push	acc
	mov	dpl,_main_voltages_1_80
	mov	dph,(_main_voltages_1_80 + 1)
	mov	b,(_main_voltages_1_80 + 2)
	mov	a,(_main_voltages_1_80 + 3)
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0xB8
	push	acc
	mov	a,#0x1E
	push	acc
	mov	a,#0x05
	push	acc
	mov	a,#0x3E
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r6
	mov	a,r7
	lcall	___fssub
	mov	_main_sloc0_1_0,dpl
	mov	(_main_sloc0_1_0 + 1),dph
	mov	(_main_sloc0_1_0 + 2),b
	mov	(_main_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	_main_vReadings_1_80,_main_sloc0_1_0
	mov	(_main_vReadings_1_80 + 1),(_main_sloc0_1_0 + 1)
	mov	(_main_vReadings_1_80 + 2),(_main_sloc0_1_0 + 2)
	mov	(_main_vReadings_1_80 + 3),(_main_sloc0_1_0 + 3)
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:452: vReadings[1] = (voltages[1]/totalMeasurements) - errorConstant;
	clr	a
	push	acc
	push	acc
	mov	a,#0xA0
	push	acc
	mov	a,#0x41
	push	acc
	mov	dpl,(_main_voltages_1_80 + 0x0004)
	mov	dph,((_main_voltages_1_80 + 0x0004) + 1)
	mov	b,((_main_voltages_1_80 + 0x0004) + 2)
	mov	a,((_main_voltages_1_80 + 0x0004) + 3)
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0xB8
	push	acc
	mov	a,#0x1E
	push	acc
	mov	a,#0x05
	push	acc
	mov	a,#0x3E
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r6
	mov	a,r7
	lcall	___fssub
	mov	r2,dpl
	mov	r3,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	(_main_vReadings_1_80 + 0x0004),r2
	mov	((_main_vReadings_1_80 + 0x0004) + 1),r3
	mov	((_main_vReadings_1_80 + 0x0004) + 2),r6
	mov	((_main_vReadings_1_80 + 0x0004) + 3),r7
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:455: printf("V(P1.3)=%3.2fV, V(P0.2)=%3.2fV Wind = %d degrees\r", vReadings[0], vReadings[1], windAngle);
	push	_windAngle
	push	(_windAngle + 1)
	push	ar2
	push	ar3
	push	ar6
	push	ar7
	push	_main_sloc0_1_0
	push	(_main_sloc0_1_0 + 1)
	push	(_main_sloc0_1_0 + 2)
	push	(_main_sloc0_1_0 + 3)
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf3
	mov	sp,a
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:458: measureCount = 0;
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:459: voltages[0] = 0;
	clr a
	mov _main_measureCount_1_80,a
	mov (_main_measureCount_1_80 + 1),a
	mov _main_voltages_1_80,a
	mov (_main_voltages_1_80 + 1),a
	mov (_main_voltages_1_80 + 2),a
	mov (_main_voltages_1_80 + 3),a
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:460: voltages[1] = 0;
	mov	(_main_voltages_1_80 + 0x0004),#0x00
	mov	((_main_voltages_1_80 + 0x0004) + 1),#0x00
	mov	((_main_voltages_1_80 + 0x0004) + 2),#0x00
	mov	((_main_voltages_1_80 + 0x0004) + 3),#0x00
L013003?:
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:464: readingADCCounter = 0;
	mov	r4,#0x00
	mov	r5,#0x00
L013008?:
;	C:\Users\Fabian Lozano\Desktop\UBC\UBC3rdYear\Term 2\ELEC 391\Controller\Code\PCA.c:471: windSensorRead();
	push	ar4
	push	ar5
	lcall	_windSensorRead
	pop	ar5
	pop	ar4
	ljmp	L013010?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 0x1B
	db '[2J'
	db 0x00
__str_1:
	db 'V(P1.3)=%3.2fV, V(P0.2)=%3.2fV Wind = %d degrees'
	db 0x0D
	db 0x00

	CSEG

end
