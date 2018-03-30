Return-Path: <rob@gnarbox.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F22DEE00C19; Fri, 30 Mar 2018 12:02:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.216.177 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BCED3E00529
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Mar 2018 12:01:59 -0700 (PDT)
Received: by mail-qt0-f177.google.com with SMTP id g5so10206558qth.7
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Mar 2018 12:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gnarbox-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=h61B9Nh+jRBycCCpMW8SAp1nGog/9m2TCKI2pobpbYo=;
	b=rvMWrf7JhUjpSSvoyNURppcYR2S8YH/vQRZpHpohaL1z/he2T6tscKmFt9t4X2dKRz
	SEOkW+ajSt3UCLkb4f+OCwXjuM2KHW92uJNWl2kL6skCriwPbaeCsSZxKyfxKfNVzVxs
	HXpVKBHKhRL4no3LZzgzzZJR8prdI4jMzM8edqLLJxtCwoPZUzQXWPiWqZyalbxRo3ck
	9YuSdhUNf8XeXyP7Rgqnx/XUeksejCFPx93kZpOGpsL9o9MMNb5y6VHqdy05pasEyS45
	dmP2rV0BcCd+UKKmX6GgwxB3r3xFV21JLZHLsOWI5TmqIAD2CBAY5ga/kNAjV4naj4o9
	/LFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=h61B9Nh+jRBycCCpMW8SAp1nGog/9m2TCKI2pobpbYo=;
	b=IiWwPml+wzjM70SOnr/YW+9fVvXO5qxlXwMpJ9ITG6cpC5qgm6fDlVIDj2k/nN1S/h
	4476PgzyDpHd+4lPvOz1xCok17CrN7HBwZ+VgjYEZ5r1ONBCu8MZuCCrzs+PhVDenJcz
	oitk2DF4oM4M9O/4VnLHwm7M8HhBjxDSwZ+zRCieOVMSKPEEzWQFT1voTlwXOkyovHbM
	Ps+juY193w9Ax5Rm/VGxbierYfeJGmd5rR+02INJRy+bkkub+zCBLcQkTrNj3s4hoKpJ
	HEGNm9996mqCZ+t388f4uYEXpD/oU0X6jQ24ymta55J/SQx3dkIjQ7jcLsMj7lg0HPsE
	gOug==
X-Gm-Message-State: ALQs6tAKpUsrvA+kpZL6dM97lCg+cteLafA7IFm9dQ85xVoPdMa2elDX
	YJrYSQU6tQ5+yAilcjeZ4X/CAD3AlIFsS4hUTNT/Ag==
X-Google-Smtp-Source: AIpwx4/1CX31kKNCqNLtnZAy2SS7SycDKbb36HgpufzosSBiQyjaHszxqqMNiWu/Pm4GZMapU+ay0TuAaZ0sg5/j/9U=
X-Received: by 10.200.9.59 with SMTP id t56mr258860qth.107.1522436518768; Fri,
	30 Mar 2018 12:01:58 -0700 (PDT)
MIME-Version: 1.0
From: Robert Weber <rob@gnarbox.com>
Date: Fri, 30 Mar 2018 19:01:48 +0000
Message-ID: <CAD+o2kBryroOyYPXUj2WMj+JeHjaJzWGFjo1s=1mzVvO-1iJ_A@mail.gmail.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Configuring a Distro for Kubernetes and CNI
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
X-List-Received-Date: Fri, 30 Mar 2018 19:02:01 -0000
Content-Type: multipart/alternative; boundary="001a11466b36e5006a0568a5dff8"

--001a11466b36e5006a0568a5dff8
Content-Type: text/plain; charset="UTF-8"

Hello meta-virt!

My name is Rob Weber, and I am software engineer who is fairly new to
Yocto. My coworker David and I are currently configuring our yocto build to
include Kubernetes in our images, but are running up against a few
challenges with networking interfaces.

We are currently including meta-virt's Kubernetes package from the "rocko"
branch in our distro. Kubernetes is successfully included the image, but we
are unfortunately missing a few networking dependencies that prevent
kube-dns from working properly. We see that there's a recipe for CNI in
recipes-networking, which Kubernetes includes as a dependency. Bruce
Ashfield's initial commit message for the CNI package is also pretty
insightful:

The networking plugins are installed, but are not configured by default to
> create any specific networking interfaces, which are the responsibility of
> the image and distribution.
>

Based on this commit message and the missing dependencies in our image, we
think we have a lot of configuration left to implement for our distro but
we're not sure where to start. We were wondering if the community might
have an idea on where to begin configuring a distro for Kubernetes? We
think we will have to include a networking plugin such as Flannel or Calico
as one of our first steps, but we're not entirely sure. Any tips people
might have are greatly appreciated!

Please let us know if you would like some more information about our distro
configuration. We would also be happy to contribute any notes on
distro/image configuration for Kubernetes to the meta-virt docs to help
others out in the future.

Thank you in advance for your help!
Rob Weber & David Roman

--001a11466b36e5006a0568a5dff8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"inbox-inbox-uyb8Gf"><div><d=
iv class=3D"inbox-inbox-pv"><div dir=3D"ltr"><div><div><div>Hello meta-virt=
!<br><br></div>My name is Rob Weber, and I am software engineer who is fair=
ly new to Yocto. My coworker David and I are currently configuring our yoct=
o build=20
to include Kubernetes in our images, but are running up against a few=20
challenges with networking interfaces. <br><br>We are currently including=
=20
meta-virt&#39;s Kubernetes package from the &quot;rocko&quot; branch in our=
 distro. Kubernetes is successfully included the image, but we
 are unfortunately missing a few networking dependencies that prevent kube-=
dns from working properly. We see that=20
there&#39;s a recipe for CNI in recipes-networking, which Kubernetes=20
includes as a dependency. Bruce Ashfield&#39;s initial commit message for=
=20
the CNI package is also pretty insightful:<br><br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">The networking plugins are installed, but are not =
configured
by default to create any specific networking interfaces, which
are the responsibility of the image and distribution. <br></blockquote><br>=
Based on=20
this commit message and the missing dependencies in our image, we think=20
we have a lot of configuration left to implement for our distro but=20
we&#39;re not sure where to start. We were wondering if the community
might have an idea on where to begin configuring a distro for=20
Kubernetes? We think we will have to include a networking plugin such as
 Flannel or Calico as one of our first steps, but we&#39;re not entirely=20
sure. Any tips people might have are greatly appreciated! <br><br></div></d=
iv></div></div></div></div><div class=3D"inbox-inbox-uyb8Gf"><div><div clas=
s=3D"inbox-inbox-F3hlO"><div dir=3D"ltr"><div><div>Please let us know if yo=
u would like some more information about our distro configuration. We would=
 also be=20
happy to contribute any notes on distro/image configuration for=20
Kubernetes to the meta-virt docs to help others out in the future.<br><br><=
/div><div>Thank you in advance for your help!<br></div><div>Rob Weber &amp;=
 David Roman<br></div></div></div></div></div></div></div></div>

--001a11466b36e5006a0568a5dff8--
