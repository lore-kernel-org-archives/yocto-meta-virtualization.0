Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0116CE01431
	for <meta-virtualization@yoctoproject.org>;
	Sat, 10 Aug 2013 19:48:19 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7B2mIph006456
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sat, 10 Aug 2013 19:48:18 -0700 (PDT)
Received: from bruce-ashfields-macbook.local (128.224.20.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Sat, 10 Aug 2013 19:48:24 -0700
Message-ID: <5206FB70.6040402@windriver.com>
Date: Sat, 10 Aug 2013 22:48:16 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Mark Asselstine <mark.asselstine@windriver.com>
References: <1376060666-19812-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1376060666-19812-1-git-send-email-mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] iasl: Add Intel ACPI license information
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sun, 11 Aug 2013 02:48:23 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-08-09 11:04 AM, Mark Asselstine wrote:
> The iasl package is licensed under the Intel ACPI license. This is a
> variation of the MIT license but with enough modification that we
> don't want to mark it as MIT. Previously building this package would
> warn about the missing license. With this change we are providing a
> clear text copy of the license and calling this license out in the
> iasl recipe to make the warning go away and to ensure we are clearly
> defining this package's license information.

One less warning to suffer.

merged!

Bruce

>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>   conf/layer.conf                        |   3 +
>   files/custom-licenses/Intel-ACPI       | 104 +++++++++++++++++++++++++++++++++
>   recipes-extended/iasl/iasl_20120215.bb |   2 +-
>   3 files changed, 108 insertions(+), 1 deletion(-)
>   create mode 100644 files/custom-licenses/Intel-ACPI
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 873ff37..4c1fa19 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -7,3 +7,6 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
>   BBFILE_COLLECTIONS += "virtualization-layer"
>   BBFILE_PATTERN_virtualization-layer := "^${LAYERDIR}/"
>   BBFILE_PRIORITY_virtualization-layer = "7"
> +
> +# Custom licenses used by some packages in this layer
> +LICENSE_PATH += "${LAYERDIR}/files/custom-licenses"
> \ No newline at end of file
> diff --git a/files/custom-licenses/Intel-ACPI b/files/custom-licenses/Intel-ACPI
> new file mode 100644
> index 0000000..df0d0bb
> --- /dev/null
> +++ b/files/custom-licenses/Intel-ACPI
> @@ -0,0 +1,104 @@
> +1. Copyright Notice
> +
> +Some or all of this work - Copyright (c) 1999 - 2010, Intel Corp.
> +All rights reserved.
> +
> +2. License
> +
> +2.1. This is your license from Intel Corp. under its intellectual property
> +rights.  You may have additional license terms from the party that provided
> +you this software, covering your right to use that party's intellectual
> +property rights.
> +
> +2.2. Intel grants, free of charge, to any person ("Licensee") obtaining a
> +copy of the source code appearing in this file ("Covered Code") an
> +irrevocable, perpetual, worldwide license under Intel's copyrights in the
> +base code distributed originally by Intel ("Original Intel Code") to copy,
> +make derivatives, distribute, use and display any portion of the Covered
> +Code in any form, with the right to sublicense such rights; and
> +
> +2.3. Intel grants Licensee a non-exclusive and non-transferable patent
> +license (with the right to sublicense), under only those claims of Intel
> +patents that are infringed by the Original Intel Code, to make, use, sell,
> +offer to sell, and import the Covered Code and derivative works thereof
> +solely to the minimum extent necessary to exercise the above copyright
> +license, and in no event shall the patent license extend to any additions
> +to or modifications of the Original Intel Code.  No other license or right
> +is granted directly or by implication, estoppel or otherwise;
> +
> +The above copyright and patent license is granted only if the following
> +conditions are met:
> +
> +3. Conditions
> +
> +3.1. Redistribution of Source with Rights to Further Distribute Source.
> +Redistribution of source code of any substantial portion of the Covered
> +Code or modification with rights to further distribute source must include
> +the above Copyright Notice, the above License, this list of Conditions,
> +and the following Disclaimer and Export Compliance provision.  In addition,
> +Licensee must cause all Covered Code to which Licensee contributes to
> +contain a file documenting the changes Licensee made to create that Covered
> +Code and the date of any change.  Licensee must include in that file the
> +documentation of any changes made by any predecessor Licensee.  Licensee
> +must include a prominent statement that the modification is derived,
> +directly or indirectly, from Original Intel Code.
> +
> +3.2. Redistribution of Source with no Rights to Further Distribute Source.
> +Redistribution of source code of any substantial portion of the Covered
> +Code or modification without rights to further distribute source must
> +include the following Disclaimer and Export Compliance provision in the
> +documentation and/or other materials provided with distribution.  In
> +addition, Licensee may not authorize further sublicense of source of any
> +portion of the Covered Code, and must include terms to the effect that the
> +license from Licensee to its licensee is limited to the intellectual
> +property embodied in the software Licensee provides to its licensee, and
> +not to intellectual property embodied in modifications its licensee may
> +make.
> +
> +3.3. Redistribution of Executable. Redistribution in executable form of any
> +substantial portion of the Covered Code or modification must reproduce the
> +above Copyright Notice, and the following Disclaimer and Export Compliance
> +provision in the documentation and/or other materials provided with the
> +distribution.
> +
> +3.4. Intel retains all right, title, and interest in and to the Original
> +Intel Code.
> +
> +3.5. Neither the name Intel nor any other trademark owned or controlled by
> +Intel shall be used in advertising or otherwise to promote the sale, use or
> +other dealings in products derived from or relating to the Covered Code
> +without prior written authorization from Intel.
> +
> +4. Disclaimer and Export Compliance
> +
> +4.1. INTEL MAKES NO WARRANTY OF ANY KIND REGARDING ANY SOFTWARE PROVIDED
> +HERE.  ANY SOFTWARE ORIGINATING FROM INTEL OR DERIVED FROM INTEL SOFTWARE
> +IS PROVIDED "AS IS," AND INTEL WILL NOT PROVIDE ANY SUPPORT,  ASSISTANCE,
> +INSTALLATION, TRAINING OR OTHER SERVICES.  INTEL WILL NOT PROVIDE ANY
> +UPDATES, ENHANCEMENTS OR EXTENSIONS.  INTEL SPECIFICALLY DISCLAIMS ANY
> +IMPLIED WARRANTIES OF MERCHANTABILITY, NONINFRINGEMENT AND FITNESS FOR A
> +PARTICULAR PURPOSE.
> +
> +4.2. IN NO EVENT SHALL INTEL HAVE ANY LIABILITY TO LICENSEE, ITS LICENSEES
> +OR ANY OTHER THIRD PARTY, FOR ANY LOST PROFITS, LOST DATA, LOSS OF USE OR
> +COSTS OF PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES, OR FOR ANY INDIRECT,
> +SPECIAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THIS AGREEMENT, UNDER ANY
> +CAUSE OF ACTION OR THEORY OF LIABILITY, AND IRRESPECTIVE OF WHETHER INTEL
> +HAS ADVANCE NOTICE OF THE POSSIBILITY OF SUCH DAMAGES.  THESE LIMITATIONS
> +SHALL APPLY NOTWITHSTANDING THE FAILURE OF THE ESSENTIAL PURPOSE OF ANY
> +LIMITED REMEDY.
> +
> +4.3. Licensee shall not export, either directly or indirectly, any of this
> +software or system incorporating such software without first obtaining any
> +required license or other approval from the U. S. Department of Commerce or
> +any other agency or department of the United States Government.  In the
> +event Licensee exports any such software from the United States or
> +re-exports any such software from a foreign destination, Licensee shall
> +ensure that the distribution and export/re-export of the software is in
> +compliance with all laws, regulations, orders, or other restrictions of the
> +U.S. Export Administration Regulations. Licensee agrees that neither it nor
> +any of its subsidiaries will export/re-export any technical data, process,
> +software, or service, directly or indirectly, to any country for which the
> +United States government or any agency thereof requires an export license,
> +other governmental approval, or letter of assurance, without first obtaining
> +such license, approval or letter.
> diff --git a/recipes-extended/iasl/iasl_20120215.bb b/recipes-extended/iasl/iasl_20120215.bb
> index e9c5fbe..5ce0930 100644
> --- a/recipes-extended/iasl/iasl_20120215.bb
> +++ b/recipes-extended/iasl/iasl_20120215.bb
> @@ -1,6 +1,6 @@
>   DESCRIPTION = "This is a cross development C compiler, assembler and linker environment for the production of 8086 executables (Optionally MSDOS COM)"
>   HOMEPAGE = "http://www.acpica.org/"
> -LICENSE = "Intel"
> +LICENSE = "Intel-ACPI"
>   LIC_FILES_CHKSUM = "file://asldefine.h;endline=115;md5=d4d7cf809b8b5e03131327b3f718e8f0"
>   SECTION = "console/tools"
>   PR="r1"
>


