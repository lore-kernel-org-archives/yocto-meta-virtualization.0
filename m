Return-Path: <pello.heriz@alumni.mondragon.edu>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9BFD4E00A39; Fri, 26 May 2017 00:53:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.218.51 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.218.51 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 72A4FE00A39
	for <meta-virtualization@yoctoproject.org>;
	Fri, 26 May 2017 00:53:21 -0700 (PDT)
Received: by mail-oi0-f51.google.com with SMTP id h4so3874398oib.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 26 May 2017 00:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=alumni.mondragon.edu; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=KSiYLUh4oYg1QtsgglZ0Ck97S3BhfzfT/TKBKsoDfa4=;
	b=eOpGKBfR6q/tTUPSgORClAzheA16KJ92yyWGaNnyPmmhnET1aToNKaxS20qgVOyure
	lOoelk/ZengSEUohdLZ95FysIgKwYcTpCcssEEDZ7f+i+XCLZCayZadC4+rKaZiT6y0z
	bPiCmNpEUPukt+t58BqfNj+ef7o6VcV519cfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=KSiYLUh4oYg1QtsgglZ0Ck97S3BhfzfT/TKBKsoDfa4=;
	b=gIGe2sXaxUCjbgh0x2nSPfs3aVL+ttWrSvLPdT9E71mtLl4yTlZUpa+WKhyabI2ztV
	1uewezT7JGQov0CaC1oc/+13zhDptbbt+ddymEWY7flxek2Hz19WqycT+faItLq1UtXV
	YC0Y8zseo2LP81GTa7aeiC3xRaEh/LDflGkIrvTZhvv+zAVhOXUWu5wr19Iy5bkRVnmM
	BvCXmF0kvRZ86yM0eoQiP2IOHY60caKjbg5lKYr+/VSae3K0XDrhqre7yx5VjyjLykuV
	/RWYBk4zaKz4RcmZAjbTXuTQAvqHPjQ2BbwOt5Vhkz7Ebm0/g2wix2AbikoPVQca5Zg0
	i/HA==
X-Gm-Message-State: AODbwcAYeS4fA647gAinguMRi8772DQhQnyfoG8oWNAXpZrUM9fg0t/d
	SlVqiZx/Al0KXll3PQg6jGgc5I4NvMRZ
X-Received: by 10.202.80.142 with SMTP id e136mr349502oib.40.1495785201169;
	Fri, 26 May 2017 00:53:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.12.181 with HTTP; Fri, 26 May 2017 00:53:20 -0700 (PDT)
From: Pello Heriz <pello.heriz@alumni.mondragon.edu>
Date: Fri, 26 May 2017 09:53:20 +0200
Message-ID: <CAFL6qn6e_8xtUkh+uX3seA=OeTok04+Rsp2a7LmEgE2AOsa=TA@mail.gmail.com>
To: meta-xilinx@yoctoproject.org, meta-virtualization@yoctoproject.org, 
	meta-xilinx-request@yoctoproject.org, yocto@yoctoproject.org, 
	Alistair Francis <alistair23@gmail.com>
Subject: xen-guest-image-minimal building error
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
X-List-Received-Date: Fri, 26 May 2017 07:53:25 -0000
Content-Type: multipart/alternative; boundary="001a113d692e938b41055068a136"

--001a113d692e938b41055068a136
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm trying to build an a xen guest image for the zcu102 board with the
master branch of Yocto, but I'm having a trouble. The building process
stops due to the next error:

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing PROVIDES 'python-smartpm-native'. Close matches:
  python-rpm-native
  python-mako-native
  python-py-native
ERROR: Required build target 'xen-guest-image-minimal' has no buildable
providers.
Missing or unbuildable dependency chain was: ['xen-guest-image-minimal',
'python-smartpm-native']

Does any body know how could I solve this issue?

Best regards,
Pello

--001a113d692e938b41055068a136
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Hi all,<br><br></div>I&#39;m trying to=
 build an a xen guest image for the zcu102 board with the master branch of =
Yocto, but I&#39;m having a trouble. The building process stops due to the =
next error:<br><br>NOTE: Resolving any missing task queue dependencies<br>E=
RROR: Nothing PROVIDES &#39;python-smartpm-native&#39;. Close matches:<br>=
=C2=A0 python-rpm-native<br>=C2=A0 python-mako-native<br>=C2=A0 python-py-n=
ative<br>ERROR: Required build target &#39;xen-guest-image-minimal&#39; has=
 no buildable providers.<br>Missing or unbuildable dependency chain was: [&=
#39;xen-guest-image-minimal&#39;, &#39;python-smartpm-native&#39;]<br><br><=
/div>Does any body know how could I solve this issue?<br><br></div>Best reg=
ards, <br></div>Pello<br></div>

--001a113d692e938b41055068a136--
