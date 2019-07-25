Return-Path: <imort.kz@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C67D9E00D86; Thu, 25 Jul 2019 00:50:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, FROM_EXCESS_BASE64,
	HTML_MESSAGE, RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (imort.kz[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.221.51 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  0.0 FROM_EXCESS_BASE64 From: base64 encoded unnecessarily
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D1C0E00D5F
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Jul 2019 00:50:37 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id x1so34643930wrr.9
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Jul 2019 00:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=cAxsux8Yl49HWVqCurK3MHyOnWxP5l9t/mM7OwMzevA=;
	b=G11ONlVk75oQV43TCOq0dLU+++pgA31dC2aW9ZeYDUd+itviDtehYNb3yfGJjRyGEa
	zq80LK1FjDDsOSkO5XVWw1zipHkxQCU+58fVmjjtJcnUg22LbFyPE6TRGb1156e0Ogl+
	DoX/lkFil4e/RMJf6fxjrCr1i7qc2gBm2MpS13VC78QQGk9CMsKOahpcg30GVv+O2lcR
	kL5+n9PSg5INguh9Z2qQxvNhWkyo4xSxkekbDlAAe09BMKOKt4TD2oy0i6/447cRBbnj
	72/v3pY4bnDnu76NhUiWnwtwD8WTaCIObQy1v6+xK7LbJ8SOhu+N7Ud+LJEwjuGFKGW1
	vKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=cAxsux8Yl49HWVqCurK3MHyOnWxP5l9t/mM7OwMzevA=;
	b=Kw9JIVSxDC5BTQJBjcI/in6LKKgR9uT3gJaIKbrBwetzUKYyOd/aZzQJdO8jG9m8Eu
	In94Zz356MVg8cc0hAJr2nUheRi2KA6GIrN9ptwGjlmfrAdmCOxQpyovFDWX0foiqZRR
	yMo1ag+JDB/dLgk1wOB+rdX2vWqkIKbmT/wq6R4R3/taEFNn7B2AYoO3K9TBRVk/n2Xt
	owPQj0R1+kuQw4utr0v/yPSqP3xaiOq+f2j9fjJJuOsEmW792hVrmO7b74oe+IZfHAln
	KiJpgE9rAz32kQLPwPbOeX8ppGyGdEcmb2wl4kgQEoCYHUXDsTTKfKCiDWkU4/TvpECr
	k19w==
X-Gm-Message-State: APjAAAXlmI87iCAlyYKCqrnFQZV3eq+yO60OWeKx7tCvcfLYkhXX3u3q
	lnU2mapR1QoesLtSMIPD7JNKMWugrrv9io1UoAkGssg5j3U=
X-Google-Smtp-Source: APXvYqyK3TDBwDjBM9n/ESZFgGX9cmWs0e0hW0RtwyYd27bLIul/1wOLQKiZ5D37BxV/UN2Mk2+4rlwNsO/fRDZOx8I=
X-Received: by 2002:a5d:4e4d:: with SMTP id r13mr2631606wrt.295.1564041036058; 
	Thu, 25 Jul 2019 00:50:36 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?0JLQsNC70LXQvdGC0LjQvQ==?= <imort.kz@gmail.com>
Date: Thu, 25 Jul 2019 13:50:25 +0600
Message-ID: <CADC8fwdtBNVwBe6Gh-MxttWzai2xBM-iN5k0+=oCLwJqGqkKMQ@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: Docker: include docker images to the Yocto image
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
X-List-Received-Date: Thu, 25 Jul 2019 07:50:40 -0000
Content-Type: multipart/alternative; boundary="0000000000005e5459058e7cae74"

--0000000000005e5459058e7cae74
Content-Type: text/plain; charset="UTF-8"

 Hello everyone,

I wonder if it's possible to pull some docker images from the repository in
the end of the Yocto image build so they'll be available without the need
to load them at the first boot?

I'm ok both with `docker pull` or `docker load` options.

Thank you


-- 
Best regards,
Valentin Kim

Skype: imortkz
Mobile & WhatsApp: +7 777 314 82 19

--0000000000005e5459058e7cae74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">
<div>Hello everyone,</div><div><br></div><div>I wonder if it&#39;s possible=
=20
to pull some docker images from the repository in the end of the Yocto=20
image build so they&#39;ll be available without the need to load them at th=
e
 first boot?</div><div><br></div><div>I&#39;m ok both with `docker pull` or=
 `docker load` options.</div><div><br></div><div>Thank you</div>

<br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature" dat=
a-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Best regards,</div><d=
iv>Valentin Kim</div><div><br></div><div><font size=3D"1">Skype: imortkz</f=
ont></div><div><font size=3D"1">Mobile &amp; WhatsApp: +7 777 314 82 19</fo=
nt></div><div><font size=3D"1"><br></font></div></div></div></div>

--0000000000005e5459058e7cae74--
