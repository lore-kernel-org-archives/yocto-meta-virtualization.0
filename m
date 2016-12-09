Return-Path: <manikandan.e@hcl.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F213CE00C88; Thu,  8 Dec 2016 23:18:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [192.8.186.130 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from GWS07.hcl.com (gws07.hcl.com [192.8.186.130])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1563CE00C5B
	for <meta-virtualization@yoctoproject.org>;
	Thu,  8 Dec 2016 23:18:23 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.33,323,1477938600"; d="scan'208";a="63056359"
Received: from unknown (HELO CHN-CORP-HT01.CORP.HCL.IN) ([10.249.2.33])
	by GWS07.hcl.com with ESMTP/TLS/AES128-SHA; 09 Dec 2016 12:48:16 +0530
Received: from CHN-HCLT-CSHT02.HCLT.CORP.HCL.IN (10.150.12.27) by
	CHN-CORP-HT01.CORP.HCL.IN (10.249.2.33) with Microsoft SMTP Server
	(TLS) id 14.3.294.0; Fri, 9 Dec 2016 12:48:14 +0530
Received: from CHN-HCLT-MBS04.HCLT.CORP.HCL.IN ([10.150.12.19]) by
	CHN-HCLT-CSHT02.HCLT.CORP.HCL.IN ([::1]) with mapi id 14.03.0294.000;
	Fri, 9 Dec 2016 12:48:14 +0530
From: Manikandan E <manikandan.e@hcl.com>
To: "M. Asselstine" <asselsm@mcmaster.ca>
Thread-Topic: [meta-virtualization] FW: docker build issues
	meta-virtualization (Krogoth)
Thread-Index: AdJQebdQWc045dtIScG8IMgDiaNuUgABBH3gAElKbIAAEirGkQ==
Date: Fri, 9 Dec 2016 07:18:13 +0000
Message-ID: <40BA76AD6F30624D8838040F50FAE7093A9AE1B4@chn-hclt-mbs04.HCLT.CORP.HCL.IN>
References: <40BA76AD6F30624D8838040F50FAE7093A9ACE96@chn-hclt-mbs04.HCLT.CORP.HCL.IN>
	<40BA76AD6F30624D8838040F50FAE7093A9ACECB@chn-hclt-mbs04.HCLT.CORP.HCL.IN>,
	<CAPuovEKkLPPas5SKExJzkkapNeZpv9P4QM+htW92aLO2A1aSAw@mail.gmail.com>
In-Reply-To: <CAPuovEKkLPPas5SKExJzkkapNeZpv9P4QM+htW92aLO2A1aSAw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.150.5.113]
MIME-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: FW: docker build issues meta-virtualization (Krogoth)
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
X-List-Received-Date: Fri, 09 Dec 2016 07:18:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi ,=0A=
=0A=
=0A=
=0A=
=0A=
               HostOS           : Ubuntu 14.04(X86_64)=0A=
               Target             : Xilinx zynqmp(aarch64)=0A=
               yocto version  :  Krogoth=0A=
=0A=
=0A=
=0A=
=0A=
Regards=0A=
Manikandan=0A=
________________________________________=0A=
From: asselsm@gmail.com [asselsm@gmail.com] on behalf of M. Asselstine [ass=
elsm@mcmaster.ca]=0A=
Sent: Friday, December 09, 2016 9:32 AM=0A=
To: Manikandan E=0A=
Cc: meta-virtualization@yoctoproject.org=0A=
Subject: Re: [meta-virtualization] FW: docker build issues meta-virtualizat=
ion (Krogoth)=0A=
=0A=
On Wed, Dec 7, 2016 at 6:34 AM, Manikandan E <manikandan.e@hcl.com> wrote:=
=0A=
> Hi All,=0A=
>=0A=
>   We are trying to compile docker with core-image minimal image on Krogot=
h=0A=
> version and facing the below issues when compiling go-native package.=0A=
>=0A=
> Log:=0A=
> -------------------=0A=
> | DEBUG: Executing shell function do_compile=0A=
> | # Building C bootstrap tool.=0A=
> | cmd/dist=0A=
> | go tool dist: unknown $GOOS ${BUILD_GOOS}=0A=
> | WARNING: exit code 1 from a shell command.=0A=
> | ERROR: Function failed: do_compile (log file is located at=0A=
> /media/csp/HMI/zcu_morty/build/tmp/work/x86_64-linux/go-native/1.4.3-r0/t=
emp/log.do_compile.16340)=0A=
>=0A=
=0A=
Can you provide details about your build host OS?=0A=
=0A=
Mark=0A=
=0A=
=0A=
>=0A=
>=0A=
> Kindly provide your suggestion.=0A=
>=0A=
>=0A=
> Regards=0A=
> Manikandan=0A=
>=0A=
>=0A=
>=0A=
> ::DISCLAIMER::=0A=
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
=0A=
>=0A=
> The contents of this e-mail and any attachment(s) are confidential and=0A=
> intended for the named recipient(s) only.=0A=
> E-mail transmission is not guaranteed to be secure or error-free as=0A=
> information could be intercepted, corrupted,=0A=
> lost, destroyed, arrive late or incomplete, or may contain viruses in=0A=
> transmission. The e mail and its contents=0A=
> (with or without referred errors) shall therefore not attach any liabilit=
y=0A=
> on the originator or HCL or its affiliates.=0A=
> Views or opinions, if any, presented in this email are solely those of th=
e=0A=
> author and may not necessarily reflect the=0A=
> views or opinions of HCL or its affiliates. Any form of reproduction,=0A=
> dissemination, copying, disclosure, modification,=0A=
> distribution and / or publication of this message without the prior writt=
en=0A=
> consent of authorized representative of=0A=
> HCL is strictly prohibited. If you have received this email in error plea=
se=0A=
> delete it and notify the sender immediately.=0A=
> Before opening any email and/or attachments, please check them for viruse=
s=0A=
> and other defects.=0A=
>=0A=
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
=0A=
>=0A=
>=0A=
> --=0A=
> _______________________________________________=0A=
> meta-virtualization mailing list=0A=
> meta-virtualization@yoctoproject.org=0A=
> https://lists.yoctoproject.org/listinfo/meta-virtualization=0A=
>=0A=

