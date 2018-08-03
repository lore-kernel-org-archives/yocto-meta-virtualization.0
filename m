Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CFE83E008E0; Thu,  2 Aug 2018 19:41:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
	[209.85.208.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9D840E0073D
	for <meta-virtualization@yoctoproject.org>;
	Thu,  2 Aug 2018 19:41:54 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id q127-v6so3646382ljq.11
	for <meta-virtualization@yoctoproject.org>;
	Thu, 02 Aug 2018 19:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=A1Z0UI5+KQnOvWbBWP8436TDo//jXogW9NNax2tsp54=;
	b=vVNp5vD4Ej8qaUPUUlej0CW+ZFc1jF6l59BaNkKJyg65QpJq1na4PFWIuiddfAW2wY
	CHkZUcdwJK8ipy8W9r2z7kcq0pgrd5W5ZASHnKEszoJei2JsC1YLP89CajEEKEO1fX7o
	XgVwcWF7RhnCtcRfpqmQnNRLWrhzDGdloXJjUTmw8IrEu6/1NCJyLfM7obdL7HGOoOmZ
	Ap4xKIwybw0JZurzEh5NwX7q7CDnPlz3TBrMIwMQGLgntIKQIP7FPBcHzlt1mE2Frx4p
	2Hp3R/Bj/SczE2XAXJC36xiAhRQ0VALw3yl4jyYfO+MzCZy3nzzEmeZ+v7bVzydgt02U
	lRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=A1Z0UI5+KQnOvWbBWP8436TDo//jXogW9NNax2tsp54=;
	b=s0MbzPWA3K76enPymj10YaDL5NZ8n2ncFXyC67f8EcvU7sWT9JN5He6uVPptmvKmsF
	0Z4MGDn+GfyB08YuxMFtYUJzlc69ToEjgaCdW5i9FWqeTIH8Rx2MzIZvWAtcDe/pkiM/
	IPzmyNOfbGmLXFxTQNzjQZjPnbTBU6SMbe8JPQEJZR16Rfo5d7WoptRqec87b6sZsixR
	O6esvIBTLlyMVij8A9pHx+7DyhyN7nhhSGHvjb991mkrzMmT/wxRzr8W8TeCWhph+eqJ
	P69f71lEJcB3/H0B8J2cDi7ghKuikduR/O40Bdn1P+nbEgVRgHuTy0xldHnThVVU4EUM
	6LRw==
X-Gm-Message-State: AOUpUlFJM/g+zp7OUzXXcCDnAVIeD7gJZ1jMewceLZxCxO/W2EJYVJwN
	7kU1cKWF5S0/dyuT8INVONXpfPtUZ2CcdGWZVjk=
X-Google-Smtp-Source: AAOMgpf5CXQHDT4D9fw5E1f3NiMWaGgl3x6tPqqVLhKMqaJETQ/AIrWbO5uEWtiWGZJIUsJcavIe6mU3RelHbtzW8bo=
X-Received: by 2002:a2e:1908:: with SMTP id p8-v6mr3689211lje.84.1533264113553;
	Thu, 02 Aug 2018 19:41:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP;
	Thu, 2 Aug 2018 19:41:53 -0700 (PDT)
In-Reply-To: <1533182670806.88977@Aviatnet.com>
References: <1533182670806.88977@Aviatnet.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 2 Aug 2018 23:41:53 -0300
Message-ID: <CADkTA4McPwViJsYLZVo4CHV5s2xYU_1PcG0oLGZcDqzmFeMR-A@mail.gmail.com>
To: David Antliff <David.Antliff@aviatnet.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Docker init script possibly uses wrong invocation?
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
X-List-Received-Date: Fri, 03 Aug 2018 02:41:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 2, 2018 at 1:04 AM, David Antliff
<David.Antliff@aviatnet.com> wrote:
> I've installed the "docker" (docker_git.bb) recipe in my ARM64 yocto image,
> from meta-virtualization 1e67a44 (24 July).
>
>
> I note that it installed /etc/init.d/docker.init, however this fails to
> start the daemon.
>
>
> The script runs `/usr/bin/docker daemon ...` however this command is not
> recognised by this program:
>
>
> # /usr/bin/docker daemon
> docker: 'daemon' is not a docker command.
>
> Instead, /usr/bin/dockerd run manually seems to do something more useful:
> # /usr/bin/dockerd
> INFO[2018-08-02T04:05:04.144036840Z] libcontainerd: started new
> docker-containerd process  pid=4643
> INFO[0000] starting containerd                           module=containerd
> revision=cfd04396dc68220d1cecbe686a6cc3aa5ce3667c.m version=v1.0.2.m
> ...
>
> I've noticed that docker.service also uses this invocation:
>
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes-containers/docker/files/docker.service
>
> This makes me wonder if I've misconfigured something, or am I unlucky in my
> timing such that docker-from-git has changed its behaviour in this area very
> recently?

I can't say that I've tested the sysvinit version of docker for quite
some time, so it very well could have some bitrot.

I do run the systemd version though, and haven't been having any issues.

Taking a look at things, I can see that yes, it should be dockerd and
the sysvinit variant has rotted. The confusion around the systemd one
is that the service file in the layer is no longer used, and is also
out of date. We use the docker.service file from the source repo
itself, and it has the correct daemon startup.

Did you want to submit a patch to update the sysvinit startup script ?

I'll cleanup the invalid/old systemd one, but since you are in a
position to test the sysvinit one, it would be better if you could do
it.

Cheers,

Bruce

>
> --
> David.
>
>
>
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

