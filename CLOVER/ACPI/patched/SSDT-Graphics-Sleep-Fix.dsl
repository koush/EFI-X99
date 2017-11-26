/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161222-64
 * Copyright (c) 2000 - 2016 Intel Corporation
 *
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of SSDT-Graphics-Sleep-Fix.aml, Thu Jun 29 15:08:50 2017
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000001BE (446)
 *     Revision         0x01
 *     Checksum         0x65
 *     OEM ID           "shiloh"
 *     OEM Table ID     "GFX1"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20100331 (537920305)
 */
DefinitionBlock ("", "SSDT", 1, "shiloh", "GFX1", 0x00001000)
{
    Device (_SB.PCI0.BR3A.GFX1)
    {
        Name (_ADR, Zero)  // _ADR: Address
        Name (_SUN, One)  // _SUN: Slot User Number
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If ((Arg2 == Zero))
            {
                Return (Buffer (One)
                {
                     0x03                                             /* . */
                })
            }

            Return (Package (0x0E)
            {
                "@0,connector-type",
                Buffer (0x04)
                {
                     0x00, 0x08, 0x00, 0x00                           /* .... */
                },

                "@1,connector-type",
                Buffer (0x04)
                {
                     0x00, 0x08, 0x00, 0x00                           /* .... */
                },

                "@2,connector-type",
                Buffer (0x04)
                {
                     0x00, 0x08, 0x00, 0x00                           /* .... */
                },

                "@3,connector-type",
                Buffer (0x04)
                {
                     0x00, 0x08, 0x00, 0x00                           /* .... */
                },

                "@4,connector-type",
                Buffer (0x04)
                {
                     0x00, 0x08, 0x00, 0x00                           /* .... */
                },

                "@5,connector-type",
                Buffer (0x04)
                {
                     0x00, 0x08, 0x00, 0x00                           /* .... */
                },

                "hda-gfx",
                Buffer (0x0A)
                {
                    "onboard-1"
                }
            })
        }
    }

    Device (_SB.PCI0.BR3A.HDAU)
    {
        Name (_ADR, One)  // _ADR: Address
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If ((Arg2 == Zero))
            {
                Return (Buffer (One)
                {
                     0x03                                             /* . */
                })
            }

            Return (Package (0x02)
            {
                "hda-gfx",
                Buffer (0x0A)
                {
                    "onboard-1"
                }
            })
        }
    }

    Device (_SB.PCI0.BR1B.GFX2)
    {
        Name (_ADR, Zero)  // _ADR: Address
        Name (_SUN, One)  // _SUN: Slot User Number
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If ((Arg2 == Zero))
            {
                Return (Buffer (One)
                {
                     0x03                                             /* . */
                })
            }

            Return (Package (0x0E)
            {
                "@0,connector-type",
                Buffer (0x04)
                {
                     0x00, 0x08, 0x00, 0x00                           /* .... */
                },

                "@1,connector-type",
                Buffer (0x04)
                {
                     0x00, 0x08, 0x00, 0x00                           /* .... */
                },

                "@2,connector-type",
                Buffer (0x04)
                {
                     0x00, 0x08, 0x00, 0x00                           /* .... */
                },

                "@3,connector-type",
                Buffer (0x04)
                {
                     0x00, 0x08, 0x00, 0x00                           /* .... */
                },

                "@4,connector-type",
                Buffer (0x04)
                {
                     0x00, 0x08, 0x00, 0x00                           /* .... */
                },

                "@5,connector-type",
                Buffer (0x04)
                {
                     0x00, 0x08, 0x00, 0x00                           /* .... */
                },

                "hda-gfx",
                Buffer (0x0A)
                {
                    "onboard-1"
                }
            })
        }
    }

    Device (_SB.PCI0.BR1B.HDAU)
    {
        Name (_ADR, One)  // _ADR: Address
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If ((Arg2 == Zero))
            {
                Return (Buffer (One)
                {
                     0x03                                             /* . */
                })
            }

            Return (Package (0x02)
            {
                "hda-gfx",
                Buffer (0x0A)
                {
                    "onboard-1"
                }
            })
        }
    }

    Name (_SB.PCI0.BR1B.H000._STA, Zero)  // _STA: Status
    Name (_SB.PCI0.BR1B.H001._STA, Zero)  // _STA: Status
    Name (_SB.PCI0.BR1B.D077._STA, Zero)  // _STA: Status
    Name (_SB.PCI0.BR1B.D081._STA, Zero)  // _STA: Status
    Name (_SB.PCI0.BR1B.D080._STA, Zero)  // _STA: Status

    Name (_SB.PCI0.BR3A.H000._STA, Zero)  // _STA: Status
    Name (_SB.PCI0.BR3A.H001._STA, Zero)  // _STA: Status
    Name (_SB.PCI0.BR3A.D077._STA, Zero)  // _STA: Status
    Name (_SB.PCI0.BR3A.D081._STA, Zero)  // _STA: Status
}
