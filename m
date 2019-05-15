Return-Path: <salerio@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7E8F2E00D97; Wed, 15 May 2019 02:22:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (salerio[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.222.47 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
	[209.85.222.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 25FEEE00CAB
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 May 2019 02:22:14 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id n7so739732uap.12
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 May 2019 02:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=83/tdXesD7JXMLtoOisPE8j3DgVUtss1mY3V4ZsQzgE=;
	b=B9MKw+1RitpW2j93vpMPjHXaUdgqEl7OAzDfTtTwPVrzYSeBhhIAN+wwM7zbbujvAo
	8VM4CZjIc1SwnEhZancIR0AUo/vFaxTOHJfT4W4YcjKjFGkWQ77C2OTTcESJxI5h7BRi
	YNj13oMqeHg3KH6t46aLnQumlSo/6p2THpDfTWeCgEl12eVE+b7902RyGbWBO7lse5P0
	FtSct753zcF6DUYhuYaaE5/yWllWDylWSFKiIr+LNto9hHQGzAqUIE4y5e+13Fx3Za6H
	RQQnMNNPuL3ZuKEHYxegeMHGBDoq5jeWqtSveYOwuY7dqOCqGod9Ox6jY1XyUJ1LvxdN
	BzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=83/tdXesD7JXMLtoOisPE8j3DgVUtss1mY3V4ZsQzgE=;
	b=I1AVgxeRVbfZ8ujeKQuzjMC+uudQvfZnBu4ynjowjPoTDpRxB9gYB8HP/4o4LGODId
	MWPYZTFYlERFXTynwfrLaKmPL4AMVWVGmroJGP7P84iNvOz4gip7bJCx0LwmLvRz+MuT
	eOlmV73yijLiLJy8yi90jZbtlFvSn6c7kaMTNFL4E0Sh+RR+DFVE44OW0wmjpJi5eTCH
	t3tILiJODPHWy2m+OiEzZRvHB8YBDlXpQPC9Mnv1Tu5ES06mAZTzHqbJnJeQezHeEGxF
	74lCfSGU3ubXxi0flg/IWcUMk0Vl4GT036MARCNG75xuRMAXyi6o7vDDlJX3hIaL6RVO
	olNA==
X-Gm-Message-State: APjAAAX/NgUnYr5Fbhjyww6NxuEldsGNmOUJtFlfDhjQIYkR3cjONQTY
	TCdnI3OW6/bl17T62tt7QVEYfcj1q3GgzdWZ3Vd9nbHVzdo=
X-Google-Smtp-Source: APXvYqx0N4xNEeOapVS3SGguYrCfUaVhSIjNv5hArEMgSK7gjaIJmW+wfBjIHJrt79seKM85ghQeZM+Sa0lPznsE/P4=
X-Received: by 2002:ab0:b0e:: with SMTP id b14mr5091109uak.116.1557912134060; 
	Wed, 15 May 2019 02:22:14 -0700 (PDT)
MIME-Version: 1.0
From: Peter Smith <salerio@gmail.com>
Date: Wed, 15 May 2019 10:21:37 +0100
Message-ID: <CAOx=Z6EgeB7_yxozw-spZaXhL0j3O8xoRyWF3auQCdA-aP=Kxw@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: Does the meta-virtualization layer support building kvm on aarch64 archiecture?
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
X-List-Received-Date: Wed, 15 May 2019 09:22:15 -0000
Content-Type: multipart/alternative; boundary="0000000000005791bc0588e9afb3"

--0000000000005791bc0588e9afb3
Content-Type: text/plain; charset="UTF-8"

I have been experimenting with using kvm on aarch64 based SoC's and after
studying the contents of the meta-virtualization layer I came to the
conclusion (maybe wrongly) that the layer does not provide full support for
building a kvm kernel on aarch64.

For example the enabling kernel configurations appear to currently be
incorrect.

I would appreciate it if someone with greater knowledge than me could put
me straight.

Thanks in advance.
Peter

--0000000000005791bc0588e9afb3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif;font-size:small">I have been experimenting with using kvm on aar=
ch64 based SoC&#39;s and after studying the contents of the meta-virtualiza=
tion layer I came to the conclusion (maybe wrongly) that the layer does not=
 provide full support for building a kvm kernel on aarch64.</div><div class=
=3D"gmail_default" style=3D"font-family:verdana,sans-serif;font-size:small"=
><br></div><div class=3D"gmail_default" style=3D"font-family:verdana,sans-s=
erif;font-size:small">For example the enabling kernel configurations appear=
 to currently be incorrect.</div><div class=3D"gmail_default" style=3D"font=
-family:verdana,sans-serif;font-size:small"><br></div><div class=3D"gmail_d=
efault" style=3D"font-family:verdana,sans-serif;font-size:small">I would ap=
preciate it if someone with greater knowledge than me could put me straight=
.=C2=A0</div><div class=3D"gmail_default" style=3D"font-family:verdana,sans=
-serif;font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-family:verdana,sans-serif;font-size:small">Thanks in advance.</div><div c=
lass=3D"gmail_default" style=3D"font-family:verdana,sans-serif;font-size:sm=
all"><span style=3D"font-family:Arial,Helvetica,sans-serif">Peter</span><br=
></div></div>

--0000000000005791bc0588e9afb3--
