Return-Path: <persaur@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 718DEE0115B; Mon, 16 Jul 2018 10:48:26 -0700 (PDT)
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
	*      [209.85.218.42 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* 0.0 MIME_QP_LONG_LINE RAW: Quoted-printable line longer than 76 chars
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D85E6E0082A
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Jul 2018 10:48:25 -0700 (PDT)
Received: by mail-oi0-f42.google.com with SMTP id k12-v6so76389010oiw.8
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Jul 2018 10:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ln5x3acVIiCpnMCdWAX6z+JXU3eLWmPbhSnjmVIYZwU=;
	b=CGf/WwFcILe129B8VF4dYXeVM0rv1jfdAxpCz/LpZ5bt9fFrm8Nh8xao39BPfFpB7G
	AE3pGPNHXVq1D4xsqHMJRqEYaWthPEv0b1XpNfieMY+jgTmlaa2bT46jg2eKHi4436lK
	GAMc+EsZuRVbadXikO/ILU6348ot1YsO4OKTpYTaXZ5y4nrIECUiADCjhsaqfO08HJA+
	omHJ1VR06Z1dguvv4gB88FivR7XeYEvnj9hiZOzcmAs4CtegT3rbLuB/P3umE9W4C+mJ
	gvuXTHf6x5gP83dIs4ADy0Nj1/hKULcLKhtPIxEmHWJ+VdmP3yAhnbYCodtsSvO0ycUn
	46pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ln5x3acVIiCpnMCdWAX6z+JXU3eLWmPbhSnjmVIYZwU=;
	b=Jj3G/9QhQXs3alsWjmDQAALlsxDsIj8CqxvRjq6zRsFcKOIwSnGKSMUGU/AdnGnRnT
	tauBB5bVlDTNZy3sX7iWuAlOfk49wCWPy4YJKQuFMwl3+wCDBRVg7q8kj7rNpVC2JnhD
	HbyV1AxXh+UsKji77r5n4KvtzOAsl4QW5pBGsZdsOC9ugIf6YU3jTXri3sNIzoJZFbJw
	VKJoWYsfnYLPXrYnLCCOclzRXm9W4PNsRberbjhGq16vxIk+BDDH3Z5IFS2OwiEVPqc5
	53DFuP3enwkYcRjcGsZeprTFJitFQRkhfjfJpnyD4VWYle75G3C0/uCtFkukmBtzM5ir
	8KiA==
X-Gm-Message-State: AOUpUlGip9JgDoIhZxaJvdE/VlCrktxklLAEVu4rGRvnjt4PXD7HWR0l
	iNDcNJcFM58HXq52oW4sFtDXGMS1
X-Google-Smtp-Source: AAOMgpcBy2c0Ic8MwHrI85CLjHy/3xSgEwb/IwEh+6dNB4h/m3a6gv/WDIP9o1o6YJd6zhvrblN13Q==
X-Received: by 2002:aca:3ad4:: with SMTP id
	h203-v6mr307452oia.294.1531763305362; 
	Mon, 16 Jul 2018 10:48:25 -0700 (PDT)
Received: from [10.134.211.82] ([104.223.51.27])
	by smtp.gmail.com with ESMTPSA id
	q206-v6sm20772704oih.46.2018.07.16.10.48.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jul 2018 10:48:24 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Rich Persaud <persaur@gmail.com>
X-Mailer: iPhone Mail (15G77)
In-Reply-To: <BB3BAB89-0582-47BD-B69F-6B01C6922237@gmail.com>
Date: Mon, 16 Jul 2018 13:48:18 -0400
Message-Id: <5BD9EFB7-55FB-4246-86DD-52C41A34F927@gmail.com>
References: <BB3BAB89-0582-47BD-B69F-6B01C6922237@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: OE Architecture <openembedded-architecture@lists.openembedded.org>
Subject: Re: Platform Security Summit 2018
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
X-List-Received-Date: Mon, 16 Jul 2018 17:48:26 -0000
Content-Type: multipart/alternative;
	boundary=Apple-Mail-78FB7498-1673-49C7-A4F7-E5349AA7C270
Content-Transfer-Encoding: 7bit

--Apple-Mail-78FB7498-1673-49C7-A4F7-E5349AA7C270
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Many thanks to Bruce Ashfield for his comprehensive overview of the meta-vir=
tualization layer!  The presentation has been posted:

https://www.platformsecuritysummit.com/2018/speaker/ashfield/

Rich

> On May 2, 2018, at 14:29, Rich Persaud <persaur@gmail.com> wrote:
>=20
> PSEC 2018 brings together security researchers and developers from the ope=
n-source ecosystems of OpenEmbedded, Xen Project and OpenXT, including prese=
ntations by OE contributors Intel, Wind River and Star Lab.
>=20
> With a focus on hardware-based security and commercially extensible open s=
ource, this 2-day, single track event is for hardware and firmware engineers=
, VMM and OS developers, security architects, integrators and senior technic=
al staff. =20
>=20
> Presentation abstracts, technical references and registration details are a=
vailable at https://platformsecuritysummit.com
>=20
> Rich

--Apple-Mail-78FB7498-1673-49C7-A4F7-E5349AA7C270
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div><span></span></div><div><meta http-equ=
iv=3D"content-type" content=3D"text/html; charset=3Dutf-8"><div><span></span=
></div><div><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"><div><span></span></div><div><meta http-equiv=3D"content-type" conten=
t=3D"text/html; charset=3Dutf-8"><div></div><div>Many thanks to Bruce Ashfie=
ld for his comprehensive overview of the meta-virtualization layer! &nbsp;Th=
e presentation has been posted:</div><div><br></div><div><a href=3D"https://=
www.platformsecuritysummit.com/2018/speaker/ashfield/">https://www.platforms=
ecuritysummit.com/2018/speaker/ashfield/</a></div><div><br></div><div><div>R=
ich</div></div><div><br></div><div>On May 2, 2018, at 14:29, Rich Persaud &l=
t;<a href=3D"mailto:persaur@gmail.com">persaur@gmail.com</a>&gt; wrote:<br><=
br></div><blockquote type=3D"cite"><div><span>PSEC 2018 brings together secu=
rity researchers and developers from the open-source ecosystems of OpenEmbed=
ded, Xen Project and OpenXT, including presentations by OE contributors Inte=
l, Wind River and Star Lab.</span><br><span></span><br><span>With a focus on=
 hardware-based security and commercially extensible open source, this 2-day=
, single track event is for hardware and firmware engineers, VMM and OS deve=
lopers, security architects, integrators and senior technical staff. &nbsp;<=
/span><br><span></span><br><span>Presentation abstracts, technical reference=
s and registration details are available at <a href=3D"https://platformsecur=
itysummit.com">https://platformsecuritysummit.com</a></span><br><span></span=
><br><span>Rich</span></div></blockquote></div></div></div></body></html>=

--Apple-Mail-78FB7498-1673-49C7-A4F7-E5349AA7C270--
