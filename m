Return-Path: <pello.heriz@alumni.mondragon.edu>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9F779E009A0; Mon, 27 Feb 2017 02:54:15 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.179 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.179 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ot0-f179.google.com (mail-ot0-f179.google.com
	[74.125.82.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F0A4E00874
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 Feb 2017 02:54:13 -0800 (PST)
Received: by mail-ot0-f179.google.com with SMTP id w44so49274817otw.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 Feb 2017 02:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=alumni.mondragon.edu; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Fn2CBzVmaW3pRlj3DQ+lHggznHZuHxWTIRX0VQGerD0=;
	b=b9KtCFbWkdCdirNDSVPb1vfLtrMOQasOlLyOuvhoeOQNo7MIiej1FdkXNAc2PESXEM
	eCNrBLCpKvD7xq7CuJV2jSkHt2ycfbPrHojTv74wHawBQFr9N2mHQaOx6Yb6WDs44z6i
	iiRWNnK1IxgV6/xRWMGxDagGScT8ni5eJzfho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Fn2CBzVmaW3pRlj3DQ+lHggznHZuHxWTIRX0VQGerD0=;
	b=NVci+WqUN3iLuiqkyL9PiT7kI5K4cm8zvASiHD71G+2ezDOBHwNICOj4hHaiCYjQMi
	LG/UaMgjmzcRwl9YrD9S8hoCtEFMy/egZyIucFzBaVoU836JwVXmpUaFkUAw4FPjSwxi
	1XrECNLtmYrQq0E/XU46K4Pr8ZyNLglev67TDtIbc28Vru656gj8+IcDHAdlmklATYUA
	5Qi/2oFN6yjpz+gtSqm4370B8eVbEavjV9rTgZc0OnmU/LfYg/HkfRx6bBRqGU3CV+gF
	7oleyThNmCc0AcUUhO2JtLztIqv9ARAIyOxl+/0uSWKwKzy9pEuR7nNoZjRd5fsOCQff
	J7hA==
X-Gm-Message-State: AMke39l8JCpzblPUzcrTH55Dbb7Otx6GPCzMW8DjQ0qK5rZOlp4hocBQo9IwSRHMjKIamdudXsaasVM9/FWOXBCu
X-Received: by 10.157.30.194 with SMTP id n60mr9014052otn.148.1488192853339;
	Mon, 27 Feb 2017 02:54:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.16.99 with HTTP; Mon, 27 Feb 2017 02:54:13 -0800 (PST)
In-Reply-To: <CAFL6qn7dufbc3dgfDywS0FNFP7DzCicuXJtGnDJDXMy1YVcX8g@mail.gmail.com>
References: <CAFL6qn7dufbc3dgfDywS0FNFP7DzCicuXJtGnDJDXMy1YVcX8g@mail.gmail.com>
From: Pello Heriz <pello.heriz@alumni.mondragon.edu>
Date: Mon, 27 Feb 2017 11:54:13 +0100
Message-ID: <CAFL6qn6-kXBkW8K5N4-jvzSs7fUrJbsq-u46NrYZWMnd29EPHA@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: Re: Using Xen hypervisor and Docker on MPSoC QEMU
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
X-List-Received-Date: Mon, 27 Feb 2017 10:54:15 -0000
Content-Type: multipart/alternative; boundary=001a1135978a6185a9054980e695

--001a1135978a6185a9054980e695
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I'm interested on building an image for ZCU102 board using Yocto Project
for then test the image on QEMU emulator. However, I need to know if is it
possible to add docker and xen hypervisor functionalities to the created
image just adding the meta-virtualization layer in the bblayers.conf file.

I have never experimented with Docker and Xen, so I don=C2=B4t know if addi=
ng
this layer would be enough or what I need to do exactly.

I would thank any reply,
Thanks,
Regards,
Pello

2017-02-27 11:51 GMT+01:00 Pello Heriz <pello.heriz@alumni.mondragon.edu>:

> Hi,
>
> I'm interested on building an image for ZCU102 board using Yocto Project
> for then test the image on QEMU emulator. However, I need to know if is i=
t
> possible to add docker and xen hypervisor functionalities to the created
> image just adding the meta-virtualization layer in the bblayers.conf file=
.
>
> I have never experimented with Docker and Xen, so I don=C2=B4t know if ad=
ding
> this layer would be enough or what I need to do exactly.
>
> I would thank any reply,
> Thanks,
> Regards,
> Pello
>

--001a1135978a6185a9054980e695
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-size:12.8px">Hi,</span><div style=3D"f=
ont-size:12.8px"><br></div><div style=3D"font-size:12.8px">I&#39;m interest=
ed on building an image for ZCU102 board using Yocto Project for then test =
the image on QEMU emulator. However, I need to know if is it possible to ad=
d docker and xen hypervisor functionalities to the created image just addin=
g the meta-virtualization layer in the bblayers.conf file.</div><div style=
=3D"font-size:12.8px"><br></div><div style=3D"font-size:12.8px">I have neve=
r experimented with Docker and Xen, so I don=C2=B4t know if adding this lay=
er would be enough or what I need to do exactly.</div><div style=3D"font-si=
ze:12.8px"><br></div><div style=3D"font-size:12.8px">I would thank any repl=
y,</div><div style=3D"font-size:12.8px">Thanks,</div><div style=3D"font-siz=
e:12.8px">Regards,</div><div style=3D"font-size:12.8px">Pello</div></div><d=
iv class=3D"gmail_extra"><br><div class=3D"gmail_quote">2017-02-27 11:51 GM=
T+01:00 Pello Heriz <span dir=3D"ltr">&lt;<a href=3D"mailto:pello.heriz@alu=
mni.mondragon.edu" target=3D"_blank">pello.heriz@alumni.mondragon.edu</a>&g=
t;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi,<div><br><=
/div><div>I&#39;m interested on building an image for ZCU102 board using Yo=
cto Project for then test the image on QEMU emulator. However, I need to kn=
ow if is it possible to add docker and xen hypervisor functionalities to th=
e created image just adding the meta-virtualization layer in the bblayers.c=
onf file.</div><div><br></div><div>I have never experimented with Docker an=
d Xen, so I don=C2=B4t know if adding this layer would be enough or what I =
need to do exactly.</div><div><br></div><div>I would thank any reply,</div>=
<div>Thanks,</div><div>Regards,</div><div>Pello</div></div>
</blockquote></div><br></div>

--001a1135978a6185a9054980e695--
