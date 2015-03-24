Return-Path: <eddy.lai.tw@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 64633E0086D; Mon, 23 Mar 2015 18:44:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (eddy.lai.tw[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.43 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1BE9CE00837
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Mar 2015 18:44:24 -0700 (PDT)
Received: by oier21 with SMTP id r21so156406712oie.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Mar 2015 18:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=pv0sZp0jfQzj6nXYfLCSiZ/ChqvAEim4dUmLUSRLOFA=;
	b=oHUWCvnluQjBhcZP7Qo7qVS5nI5huwktkT5CtuC2tWwii/MFDS2rH68Ny4mvc5G7Hg
	IAqtXLEqjREXp9cZB4uHNSODbZgh4Okf0ZJZUl1nV7gRlTSfkJ2kAKr/Lq37Q5xeX9eZ
	72C6vXmFAiYdHzLViI0mkoyAhrUFmZoEjn8d8wUEolGo7AY9ZaCKazA94lo04HZQnMeJ
	nwVhG0+YBGfvWkGF15YZzyWQk4yNq4ACYN6l5Ky6X3u6U3X+W5c9BoQqE8Jc9KuvpuAk
	e0cCXiz9mwlQalFnlFUItelFwax3c6mBqcXFjvF02n80ye9ZDLcTNLQ0N3qkjAACq0GY
	PU0Q==
MIME-Version: 1.0
X-Received: by 10.202.106.12 with SMTP id f12mr1377347oic.39.1427161464069;
	Mon, 23 Mar 2015 18:44:24 -0700 (PDT)
Received: by 10.76.4.173 with HTTP; Mon, 23 Mar 2015 18:44:24 -0700 (PDT)
Date: Tue, 24 Mar 2015 09:44:24 +0800
Message-ID: <CACrgodchGbC3uGh3izSfE68VXmPy5j=RYWQmRsPaRUtT5ot31A@mail.gmail.com>
From: Lai Eddy <eddy.lai.tw@gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: ERROR: Layer 'networking-layer' depends on layer 'meta-python'
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
X-List-Received-Date: Tue, 24 Mar 2015 01:44:27 -0000
Content-Type: multipart/alternative; boundary=001a1140403a1a63290511feec01

--001a1140403a1a63290511feec01
Content-Type: text/plain; charset=UTF-8

trying to build $ bitbake kvm-image-minimal with Ubuntu 13.10 host, poky
1.7.1
and following README inside meta-virtualization to setup me-virtualization,
oe-core, meta-oe dependencys,

got following error messge:
$ bitbake kvm-image-minimal
ERROR: Layer 'networking-layer' depends on layer 'meta-python', but this
layer is not enabled in your configuration


should meta-oe/meta-python added other than meta-oe, meta-networking and
meta-filesystems as README said?

--001a1140403a1a63290511feec01
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>trying to build $ bitbake kvm-image-minimal=
 with Ubuntu 13.10 host, poky 1.7.1<br></div>and following README inside me=
ta-virtualization to setup me-virtualization, oe-core, meta-oe dependencys,=
<br><br></div>got following error messge:<br>$ bitbake kvm-image-minimal<br=
>ERROR: Layer &#39;networking-layer&#39; depends on layer &#39;meta-python&=
#39;, but this layer is not enabled in your configuration<br><br><br></div>=
should meta-oe/meta-python added other than meta-oe, meta-networking and me=
ta-filesystems as README said?<br></div>

--001a1140403a1a63290511feec01--
