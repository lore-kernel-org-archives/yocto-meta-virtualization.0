Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AC04AE008D0; Tue, 21 Feb 2017 11:23:45 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.173 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 750AAE00524
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Feb 2017 11:23:41 -0800 (PST)
Received: by mail-qk0-f173.google.com with SMTP id s186so131856686qkb.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Feb 2017 11:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JRrGIY3W3y/HlM8apEFIf/Jcd7a6aTxbby6Iddrn+5E=;
	b=ZWyRgznDSTW7G7wAMTFq1Zco66djsK9UTw5dLr/zDhR2oC4CAnvx30X9vHDJ4XdqE7
	XlSk88Hlrdn5+Xfz8Wn35He7DKt3/Q/s6neTICmYpHNPqq7sZzUMIFZdJjMlsgLQRqFI
	oThjGi0wJwstN/ZWiKGTDZLBk5JNJ/OMtFR4vhXRuXJyf0TE0kUOUrCcZKM74Noa37P7
	D+coU9/qEgEgHtcRgRkY64uXH9PRqBugNmlfu7vEfivg33agBUZ3CMDep6UnaDJagEjI
	zRyr5IjKlVGxrTq9v1trbY7SHVuIMNBPgVB0jflPHmMW1YqKAw3H8wUUGyHVNpT8BPbh
	oRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JRrGIY3W3y/HlM8apEFIf/Jcd7a6aTxbby6Iddrn+5E=;
	b=S3D9g6F1bkbpNTmtkxwbsHby7QyL+qppNNZYTecruNgCFEAzS7+PuLp8x9llvc5Muk
	Gp3RDfR8kD4M+x8reCF/5oG+ZdcOKK8uMCIm3PcAnQum472mE0lTHfrMf5FePW9NJY4U
	K9n8f+zsITFfDCkIGc5hAC2ria5a1mqXQGDN4lSO3VmQyqk6PD4JcQNFXnvj/6R7UoU7
	t9olicotrnahwmpDbuxZLolZAID9QO3k9vp7RnQvl90BoCKBz3r2LiTChcDtciy9+0wg
	vN4gsQoO4Kz0bD/V5eyOzAMzdC8pcZZqijzav1EtEw3vbKTtjS1QzsxhL3KjErKIi6al
	Q0ew==
X-Gm-Message-State: AMke39mpgMjkhCawKcut/O2a5NMeY4qLCOWi88g4n2tFHQdFQj8FA9q40Fj0pZBlKmvP6fuAGr4ShboeTzzUIQ==
X-Received: by 10.55.97.143 with SMTP id v137mr25988562qkb.211.1487705021024; 
	Tue, 21 Feb 2017 11:23:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Tue, 21 Feb 2017 11:23:40 -0800 (PST)
In-Reply-To: <1486741468-4476-1-git-send-email-mark.asselstine@windriver.com>
References: <1486741468-4476-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 21 Feb 2017 14:23:40 -0500
Message-ID: <CADkTA4P9KCy4qZmRNwUtTiwan+XQdkCtRo7vrjgfzS_Pa+jRCQ@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 0/2] get docker working again (broken by per recipe sysroots)
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
X-List-Received-Date: Tue, 21 Feb 2017 19:23:45 -0000
Content-Type: multipart/alternative; boundary=94eb2c0578304f131505490f5104

--94eb2c0578304f131505490f5104
Content-Type: text/plain; charset=UTF-8

Following up to the list. I did finally merge this change after creating a
virtual/run
and virtual/containerd namespace for these two packages.

I've made the default preferred provider to be runc-docker, but for someone
that wants
to build the tip of the opencontainers tree, there is also a
runc-opencontainers. A
similar split exists within containerd.

Once docker and the opencontainer equivalent become one, I can undo the
virtual/*
namespace changes.

Bruce

On Fri, Feb 10, 2017 at 10:44 AM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

>
> By uprev'ing runc and containerd to the versions specified by docker's
> vendor.conf file we are able to get the docker runtime back to a fully
> functional state (ie. it now passes some basic usecases)
>
> This series is applied on top of the commit sent by Jan Kiszka
> [containerd: Fix build on 386] but should apply with our without that
> merged.
>
> It is highly unfortunate that docker is forking runc. Although we only
> have docker using runc at the moment this has the potential to cause
> issues if/when we get other runc users integrated.
>
> With these changes we can now run docker pull, docker run, docker
> images, docker ps -a,... successfully. Running 'docker run
> hello-world' produces the expected results:
>
> ----
>   Hello from Docker!
>   This message shows that your installation appears to be working
> correctly.
>
>   To generate this message, Docker took the following steps:
>   1. The Docker client contacted the Docker daemon.
>   2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
>   3. The Docker daemon created a new container from that image which runs
> the
>      executable that produces the output you are currently reading.
>   4. The Docker daemon streamed that output to the Docker client, which
> sent it
>      to your terminal.
>
>   To try something more ambitious, you can run an Ubuntu container with:
>   $ docker run -it ubuntu bash
>
>   Share images, automate workflows, and more with a free Docker ID:
>   https://cloud.docker.com/
>
>   For more examples and ideas, visit:
>   https://docs.docker.com/engine/userguide/
> ----
>
> Running 'docker info' we also see that there is no longer a mismatch
> reported for these dependencies.
>
> Mark
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c0578304f131505490f5104
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div>Following up to the lis=
t. I did finally merge this change after creating a virtual/run<br></div>an=
d virtual/containerd namespace for these two packages.<br><br></div>I&#39;v=
e made the default preferred provider to be runc-docker, but for someone th=
at wants<br></div>to build the tip of the opencontainers tree, there is als=
o a runc-opencontainers. A <br></div>similar split exists within containerd=
.<br><br></div>Once docker and the opencontainer equivalent become one, I c=
an undo the virtual/*<br></div>namespace changes.<br><br></div>Bruce<br></d=
iv><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Feb 10=
, 2017 at 10:44 AM, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto=
:mark.asselstine@windriver.com" target=3D"_blank">mark.asselstine@windriver=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
By uprev&#39;ing runc and containerd to the versions specified by docker&#3=
9;s<br>
vendor.conf file we are able to get the docker runtime back to a fully<br>
functional state (ie. it now passes some basic usecases)<br>
<br>
This series is applied on top of the commit sent by Jan Kiszka<br>
[containerd: Fix build on 386] but should apply with our without that<br>
merged.<br>
<br>
It is highly unfortunate that docker is forking runc. Although we only<br>
have docker using runc at the moment this has the potential to cause<br>
issues if/when we get other runc users integrated.<br>
<br>
With these changes we can now run docker pull, docker run, docker<br>
images, docker ps -a,... successfully. Running &#39;docker run<br>
hello-world&#39; produces the expected results:<br>
<br>
----<br>
=C2=A0 Hello from Docker!<br>
=C2=A0 This message shows that your installation appears to be working corr=
ectly.<br>
<br>
=C2=A0 To generate this message, Docker took the following steps:<br>
=C2=A0 1. The Docker client contacted the Docker daemon.<br>
=C2=A0 2. The Docker daemon pulled the &quot;hello-world&quot; image from t=
he Docker Hub.<br>
=C2=A0 3. The Docker daemon created a new container from that image which r=
uns the<br>
=C2=A0 =C2=A0 =C2=A0executable that produces the output you are currently r=
eading.<br>
=C2=A0 4. The Docker daemon streamed that output to the Docker client, whic=
h sent it<br>
=C2=A0 =C2=A0 =C2=A0to your terminal.<br>
<br>
=C2=A0 To try something more ambitious, you can run an Ubuntu container wit=
h:<br>
=C2=A0 $ docker run -it ubuntu bash<br>
<br>
=C2=A0 Share images, automate workflows, and more with a free Docker ID:<br=
>
=C2=A0 <a href=3D"https://cloud.docker.com/" rel=3D"noreferrer" target=3D"_=
blank">https://cloud.docker.com/</a><br>
<br>
=C2=A0 For more examples and ideas, visit:<br>
=C2=A0 <a href=3D"https://docs.docker.com/engine/userguide/" rel=3D"norefer=
rer" target=3D"_blank">https://docs.docker.com/<wbr>engine/userguide/</a><b=
r>
----<br>
<br>
Running &#39;docker info&#39; we also see that there is no longer a mismatc=
h<br>
reported for these dependencies.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Mark<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div>

--94eb2c0578304f131505490f5104--
