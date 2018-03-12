Return-Path: <persaur@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F0CBCE00DE0; Sun, 11 Mar 2018 22:58:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	MIME_QP_LONG_LINE, 
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (persaur[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.176 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* 0.0 MIME_QP_LONG_LINE RAW: Quoted-printable line longer than 76 chars
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66716E00843
	for <meta-virtualization@yoctoproject.org>;
	Sun, 11 Mar 2018 22:58:37 -0700 (PDT)
Received: by mail-qk0-f176.google.com with SMTP id b198so1021968qkg.9
	for <meta-virtualization@yoctoproject.org>;
	Sun, 11 Mar 2018 22:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=content-transfer-encoding:from:mime-version:message-id:date:subject
	:to; bh=SifhZb4JODmIc4P1oCWtAASK7JJRpk9IItqmVZyY+O4=;
	b=g3M7GoRdbrsw1AyrZ6nXAC+2/ddGgxUS8HgC3TeXWJmBjAZ6veinB+DqdjdEIilnkB
	HFWxuL/l7gfnqBAyUenbxDqYOZzUBvPIf7bnAZz3+IvnlbZ4dpeQQWFzgpf6glWeTChz
	QK6tdqmTm4zN/5qLTUA6aqRfunKoPnNMGqIdJknp6V2BT8XZQvNFqGAm1sxFKajCajyW
	pBbH7e9yIqpsC+PKzvgPVRlb7dW6fOwEGl4iu8H6xbHi284ozfCiCXvw7lnCDPSjRjjL
	WLGBbdxATmdVqGdk/SuubQzgfmljMl+OOuAOdI6nzHiUH4PQDIHBjVBxJwa2LgZxbVg8
	JFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:content-transfer-encoding:from:mime-version
	:message-id:date:subject:to;
	bh=SifhZb4JODmIc4P1oCWtAASK7JJRpk9IItqmVZyY+O4=;
	b=kaYfdXcLrd3y5EdguymZqq/3Tp75/sbIHwsZ3+e6uKZdHEzSOiMwGI9s5EA0/jFQjA
	H56dRfkKYBsnkz9FIlQwdCO+frr7X8kFt64nKZ/y0kE/5SHALTVSWYQFHEtLbCiPC4i3
	EoGFtgdRqCC+j75K+F+3D0GIYDizdiFrdtEQ9BKhmMPkpt7RXCUGKdRmdbLqzhkHB5yu
	yEyFDsX699ZU0OCAtUSU2aipZdFC7bAdaHnXB/3XwWSMKe4SvbeG0nyEuzxA+jRpLliV
	Yyg/8DYtKXu5xWdT+U0KnRzZPiyDB6xsgHJme/uoNJL4Vaj2w3wbrwSyVJJDPDFcLnWv
	3U0A==
X-Gm-Message-State: AElRT7GlNOmmcNhEVhIzyYEU1ZGOJCUaGHc3PisaVrV7P9mbTWpB/JOS
	m40QJ3NBUJC4UvotKaYZcCIu4RfO
X-Google-Smtp-Source: AG47ELvc76UqgzaKuLPUEcFxkmRj2yFFDWEpz6xLkTjZ6MugLowJcUji+SYdgE62yY9ON/Sb1+mUqw==
X-Received: by 10.55.20.76 with SMTP id e73mr5543278qkh.236.1520834317157;
	Sun, 11 Mar 2018 22:58:37 -0700 (PDT)
Received: from [100.64.72.56] ([173.245.215.240])
	by smtp.gmail.com with ESMTPSA id
	h184sm3843213qkc.78.2018.03.11.22.58.36
	for <meta-virtualization@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 Mar 2018 22:58:36 -0700 (PDT)
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Received: from [100.64.72.56] ([173.245.215.240]) by smtp.gmail.com with
	ESMTPSA id l1sm1822906qtb.33.2018.03.11.22.49.03 for
	<openxt@googlegroups.com> (version=TLS1_2
	cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 Mar 2018 22:49:03 -0700 (PDT)
Message-Id: <1BEE2C27-F0BE-4C0A-8D57-4EAFF95BC2D7@gmail.com>
Date: Mon, 12 Mar 2018 01:58:35 -0400
X-Mailer: iPad Mail (15D100)
To: meta-virtualization@yoctoproject.org
Subject: CFP: Platform Security Summit 2018: OpenXT, Xen Project and OpenEmbedded
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
X-List-Received-Date: Mon, 12 Mar 2018 05:58:39 -0000
Content-Transfer-Encoding: 7bit
Content-Type: multipart/alternative;
	boundary=Apple-Mail-B5EC85F8-6349-4154-90AF-31257AC4D291

--Apple-Mail-B5EC85F8-6349-4154-90AF-31257AC4D291
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

If you are working on commercial, academic or open-source projects which use=
 OpenXT, Xen Project or OpenEmbedded to implement platform components with w=
ell-defined security properties, you are invited to present at Platform Secu=
rity Summit 2018, which will take place on May 23-24 in Fairfax, VA, USA.

Topics of interest include:

 - Virtualization-based isolation of open, proprietary and restricted code
 - Architecture for disaggregation of Xen-based systems
 - Mixed-criticality system design, testing and safety certification
 - Scheduling, hardware partitioning and hypervisor nesting
 - Xen PVH, PCI passthrough, PV-IOMMU, Qemu disaggregation

 - Hardware-rooted security technologies (e.g. TPM, TEE, SGX)
 - Measured launch, DRTM and SRTM deployment models
 - Stateless VMs and unikernels with OpenEmbedded
 - Reproducible, cross-compiled builds with OpenEmbedded
 - Spectre/Meltdown mitigations, performance & security

 - Inter-VM and Multi-Hypervisor Communication
 - Networking technologies for mutually trusting systems
 - Mandatory Access Control (e.g. SE Linux, Xen Security Modules)
 - Fuzzing of Xen, OpenEmbedded and platform firmware
 - GPU and co-processor virtualization=20

The 2-day event will have a single track of presentations and discussions.  T=
here is no cost to attend, but space will be limited.  If you would like to p=
resent or attend, please respond to this message by Friday, 31st March, stat=
ing your organization name and topics of interest.

Rich=

--Apple-Mail-B5EC85F8-6349-4154-90AF-31257AC4D291
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div><span></span></div><div><meta http-equ=
iv=3D"content-type" content=3D"text/html; charset=3Dutf-8"><div><span></span=
></div><div><div><span></span></div><div><meta http-equiv=3D"content-type" c=
ontent=3D"text/html; charset=3Dutf-8"><div><span></span></div><div><meta htt=
p-equiv=3D"content-type" content=3D"text/html; charset=3Dutf-8"><div><span><=
/span></div><div><meta http-equiv=3D"content-type" content=3D"text/html; cha=
rset=3Dutf-8"><div><span></span></div><div><meta http-equiv=3D"content-type"=
 content=3D"text/html; charset=3Dutf-8"><p style=3D"margin: 0px; font-stretc=
h: normal; line-height: normal; min-height: 13.8px;"><span style=3D"backgrou=
nd-color: rgba(255, 255, 255, 0);">If you are working on commercial, academi=
c or open-source projects which use OpenXT, Xen Project or OpenEmbedded to i=
mplement platform components with well-defined security properties, you are i=
nvited to present at <i>Platform Security Summit 2018</i>, which will take p=
lace on May 23-24 in Fairfax, VA, USA.</span></p><p style=3D"margin: 0px; fo=
nt-stretch: normal; line-height: normal; min-height: 13.8px;"><span style=3D=
"background-color: rgba(255, 255, 255, 0);"><br></span></p><p style=3D"margi=
n: 0px; font-stretch: normal; line-height: normal;"><span style=3D"backgroun=
d-color: rgba(255, 255, 255, 0);">Topics of interest include:</span></p><p s=
tyle=3D"margin: 0px; font-stretch: normal; line-height: normal; min-height: 1=
3.8px;"><span style=3D"background-color: rgba(255, 255, 255, 0);"><br></span=
></p><p style=3D"margin: 0px; font-stretch: normal; line-height: normal;"><s=
pan style=3D"background-color: rgba(255, 255, 255, 0);">&nbsp;- Virtualizati=
on-based isolation of open, proprietary and restricted code</span></p><p sty=
le=3D"margin: 0px; font-stretch: normal; line-height: normal;"><span style=3D=
"background-color: rgba(255, 255, 255, 0);">&nbsp;- Architecture for disaggr=
egation of Xen-based systems</span></p><p style=3D"margin: 0px; font-stretch=
: normal; line-height: normal;"><span style=3D"background-color: rgba(255, 2=
55, 255, 0);">&nbsp;- Mixed-criticality system design, testing and safety ce=
rtification</span></p><p style=3D"margin: 0px; font-stretch: normal; line-he=
ight: normal;"><span style=3D"background-color: rgba(255, 255, 255, 0);">&nb=
sp;- Scheduling, hardware partitioning and hypervisor nesting</span></p><p s=
tyle=3D"margin: 0px; font-stretch: normal; line-height: normal;"><span style=
=3D"background-color: rgba(255, 255, 255, 0);">&nbsp;- Xen PVH, PCI passthro=
ugh, PV-IOMMU, Qemu disaggregation</span></p><p style=3D"margin: 0px; font-s=
tretch: normal; line-height: normal; min-height: 13.8px;"><span style=3D"bac=
kground-color: rgba(255, 255, 255, 0);"><br></span></p><p style=3D"margin: 0=
px; font-stretch: normal; line-height: normal;"><span style=3D"background-co=
lor: rgba(255, 255, 255, 0);">&nbsp;- Hardware-rooted security technologies (=
e.g. TPM, TEE, SGX)</span></p><p style=3D"margin: 0px; font-stretch: normal;=
 line-height: normal;"><span style=3D"background-color: rgba(255, 255, 255, 0=
);">&nbsp;- Measured launch, DRTM and SRTM deployment models</span></p><p st=
yle=3D"margin: 0px; font-stretch: normal; line-height: normal;"><span style=3D=
"background-color: rgba(255, 255, 255, 0);">&nbsp;- Stateless VMs and uniker=
nels with OpenEmbedded</span></p><p style=3D"margin: 0px; font-stretch: norm=
al; line-height: normal;"><span style=3D"background-color: rgba(255, 255, 25=
5, 0);">&nbsp;- Reproducible, cross-compiled builds with OpenEmbedded</span>=
</p><p style=3D"margin: 0px; font-stretch: normal; line-height: normal;"><sp=
an style=3D"background-color: rgba(255, 255, 255, 0);">&nbsp;- Spectre/Meltd=
own mitigations, performance &amp; security</span></p><p style=3D"margin: 0p=
x; font-stretch: normal; line-height: normal; min-height: 13.8px;"><span sty=
le=3D"background-color: rgba(255, 255, 255, 0);"><br></span></p><p style=3D"=
margin: 0px; font-stretch: normal; line-height: normal;"><span style=3D"back=
ground-color: rgba(255, 255, 255, 0);">&nbsp;- Inter-VM and Multi-Hypervisor=
 Communication</span></p><p style=3D"margin: 0px; font-stretch: normal; line=
-height: normal;"><span style=3D"background-color: rgba(255, 255, 255, 0);">=
&nbsp;- Networking technologies for mutually trusting systems</span></p><p s=
tyle=3D"margin: 0px; font-stretch: normal; line-height: normal;"><span style=
=3D"background-color: rgba(255, 255, 255, 0);">&nbsp;- Mandatory Access Cont=
rol (e.g. SE Linux, Xen Security Modules)</span></p><p style=3D"margin: 0px;=
 font-stretch: normal; line-height: normal;"><span style=3D"background-color=
: rgba(255, 255, 255, 0);">&nbsp;- Fuzzing of Xen, OpenEmbedded and platform=
 firmware</span></p><p style=3D"margin: 0px; font-stretch: normal; line-heig=
ht: normal;"><span style=3D"background-color: rgba(255, 255, 255, 0);">&nbsp=
;- GPU and co-processor virtualization&nbsp;</span></p><p style=3D"margin: 0=
px; font-stretch: normal; line-height: normal; min-height: 13.8px;"><span st=
yle=3D"background-color: rgba(255, 255, 255, 0);"><br></span></p><p style=3D=
"margin: 0px; font-stretch: normal; line-height: normal;"><span style=3D"bac=
kground-color: rgba(255, 255, 255, 0);">The 2-day event will have a single t=
rack of presentations and discussions.&nbsp;&nbsp;There is no cost to attend=
, but space will be limited.&nbsp;&nbsp;If you would like to present or atte=
nd, please respond to this message by Friday, 31st March, stating your organ=
ization name and topics of interest.</span></p><p style=3D"margin: 0px; font=
-stretch: normal; line-height: normal;"><br></p><p style=3D"margin: 0px; fon=
t-stretch: normal; line-height: normal;"><span style=3D"background-color: rg=
ba(255, 255, 255, 0);">Rich</span></p></div></div></div></div></div></div></=
body></html>=

--Apple-Mail-B5EC85F8-6349-4154-90AF-31257AC4D291--
