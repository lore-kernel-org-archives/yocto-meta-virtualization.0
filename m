Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A689BE00D5F; Tue, 17 Sep 2019 05:31:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.41 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
	[209.85.167.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EF63FE00D4F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Sep 2019 05:31:55 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 72so2733110lfh.6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Sep 2019 05:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=meD2E6d++RQCkG+WD9tcWZY0Nk6JtuJtcW0f5SgJtY0=;
	b=qfvbfmZELJhzAXgQ02aGpdiClmb5PAGMtd1+Ru8sIe3gi5qgUi9fdSrRUTIFyrQO7o
	cQNbFtjDqX3AUg+6WB8ezH4XGaqMgvCsnVVCti5dM1L6qxPwLljci/UVwFedAonxHrsK
	EMsAYDxCBbPyfqHml6Xivh24hbt8LIY5EkCI5cF4Q6Rjq8RPqyEIAlW5L8hLL9AyY76s
	Rve7Tk9VcRqfT9epbC/WIbViZsyknLz0Fq7me1/VEsGh7N1YRQfubBRqu2/UOs1V6ubQ
	73rBh8rew6gRwL5ojpNBpLTeDEqZbV4mDG24CLnQ+SQ51XuL3ltpseW6oY9PNokJ0X/d
	MAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=meD2E6d++RQCkG+WD9tcWZY0Nk6JtuJtcW0f5SgJtY0=;
	b=obQKAhZ1+DznqIQgafM+UWTRCuBr0Y3B5KZJS6+PBQAXe+850YWGrEDCNxzVOYSq7w
	R//t/17g4e/jBbnXMhXifY0sAtoBsapSNsgFq6UWO3nwZrDJm0R38+PEfXqR8Af5o7t/
	vt/IOdRSHkItWowe3swQSXAWsG4LuPqEhULinKiuwYf/rYy4EvJQiBxsSya5K2Tjuhb9
	TcH6y/N5+JsNr7KQ/Qhp4qfQLp3SByE5CcCJVgc5UxrQRoSTf+H2ppjCGXBGjthA768z
	JG0A87hifLvM3A6RDBIE6928ppbchuibrzM3FNJvGj+VmYKM7TimhrinhqO4nnfjvBBx
	7kdA==
X-Gm-Message-State: APjAAAWsKq6K1Z3VFH7ms0gzZQnHS/sgFOSXeoDCbZVLs6cbVD0eFnZP
	ryCwDBlDhlUtYNJjMeECi+wCEBng7O9klbTeU3tr7rVrx0w=
X-Google-Smtp-Source: APXvYqxOwpXdGB8ByLPG3p1AcCUhXb6XTBTik1r9huELUbMDBuZjlDoyWzkccUJB3jg510wCP/l8zxrODsCb0OJmadc=
X-Received: by 2002:a19:428f:: with SMTP id p137mr1994755lfa.149.1568723514583;
	Tue, 17 Sep 2019 05:31:54 -0700 (PDT)
MIME-Version: 1.0
References: <a1b3032c01c1443a9b9562e94a98b254@haverboecker.com>
In-Reply-To: <a1b3032c01c1443a9b9562e94a98b254@haverboecker.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 17 Sep 2019 08:31:43 -0400
Message-ID: <CADkTA4P+Z5x=Uet_U9tdMPiEPpLN_pb7jm4xL51gAPxFMPrOHQ@mail.gmail.com>
To: "Ketterle, Peer" <P.Ketterle@haverboecker.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Problem with docker, iptables and meta-virtualisation
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
X-List-Received-Date: Tue, 17 Sep 2019 12:31:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2019 at 6:46 AM Ketterle, Peer
<P.Ketterle@haverboecker.com> wrote:
>
> Hello!
>
>
>
> I am sorry, I don=E2=80=99t know where to ask, so I=E2=80=99m writing thi=
s e-mail. If there is a place like a forum or something like that to better=
 ask for help, please show me where to go.
>
>
>
> I am new to yocto, so maybe I am just doing something pretty dumb but I c=
annot find out right now what the problem is.
>
>
>
> So, now for my problem. I want to build a yocto for an amd64 with azure-i=
ot support. For this I need meta-virtualisation. I tried the warrior branch=
 first, then the thud branch, both got the same result in this regard. So I=
 believe it has nothing to do with the exact branch.
>
> I got the image to build, but when I run it, dockerd is not working. I ca=
n start it but it fails with a problem with iptables, see attachment.
>
> I have also attached the local.conf and the bblayers.conf as well as the =
output of the bitbake-command.
>
>
>
> Do you have an idea what I am doing wrong? Or maybe there is a simple pre=
set of conf-files which works from where I could go on.
>

Two things jump to mind for me.

- Can you check that the "kernel-modules" package is installed in the
image type you are using ? I did a quick glance at
core-image-full-cmdline and didn't see it, but I didn't chase down all
the includes (or fire up a build to check the package install list)

- Are you using systemd as your init manager ? I know that I haven't
tested sysvinit myself for some time, so there may be bitrot there.

Bruce

>
>
> Thanks a lot for your help!
>
>
>
> Best regards,
>
>
>
> Peer
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

