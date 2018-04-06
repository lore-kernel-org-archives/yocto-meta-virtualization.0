Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6CE7EE00B8D; Fri,  6 Apr 2018 07:24:15 -0700 (PDT)
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
	*      [209.85.215.45 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 77A44E008E4
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Apr 2018 07:24:14 -0700 (PDT)
Received: by mail-lf0-f45.google.com with SMTP id p142-v6so813306lfd.6
	for <meta-virtualization@yoctoproject.org>;
	Fri, 06 Apr 2018 07:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3UlofiaRREFz269IQ6/HFGAzZx5R3FThRNUZyBY+B3o=;
	b=GmwnoWWO9hdxbB2jPbnVE4mf39aOiZAQHfrct69KVR0SX4aCxhIkopOkJ5E5zZIlEa
	ooDotYJmm/kT3NK4fyQp7441RCHmsvVfHLO8AQXAGh1BdMe7rqqjxpWkx+HXzC+l2M3v
	roWjbLyJkEEOUW/gNRACrdy4+uLQd7ez5JFyDeD/OSIuSUCyPT1PUd74bXHcq9UVY9s2
	NWDzlZ3quNHBGqYKRckJXEEcZ7SoKqhMSKjaFQ5x+80j7cCWL28Ejo3v5babs+kC4Qpq
	U/WAiF/laG1zfwo96021v/GnQHwWs3obdFDvDj/ooyOQIQ7r2tfAx0Exa0UAzPkYvsZy
	XGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3UlofiaRREFz269IQ6/HFGAzZx5R3FThRNUZyBY+B3o=;
	b=T859aih+aOnGhhMux+locWU8ojE3uZb7eFa+GyCGeqZ7cZp557Mp7M2ZdUD3VZihmA
	Njw1v0uA0ALoYCFA0t0D+1GbX9aqolCJEXxcs9WtdjI3QALUWx2fh2v+e7GikTZbk7Ua
	1lb4wxmga0YikJcN9fokDqM1ztH1z4rX6DFy8aCmU0bIXpqluOKwndBX/osokvxAnmK8
	AQATbBcGZetJ+fP88FxsglGe283qpRCTOERglQ4p3acoiSE/dGZYNMuf6c7RdIdlEYbE
	xhYX3K0AoZtjhvU9waytDAuIV49iGiFhBRVMmQJKFOX1vIIAAbK21pVVeOzs5YmyttXr
	kUcQ==
X-Gm-Message-State: ALQs6tBCNCOyePIrZbvwmmKZa5mLnkeqECRtQ4zRb7qs294XZvHU12mF
	c0McAgOpPu2h/hOeMBjRn7JupRYmGeMSVSAt6rA=
X-Google-Smtp-Source: AIpwx4+6vn5B16FUkPMJSCIxwamQW6ciVgKzgUkKikaGe1yvI6JOZlGcUJUXiGCJRAcu4I4/P9l+iMDUYOCx2SSQDfY=
X-Received: by 2002:a19:5c4b:: with SMTP id
	q72-v6mr17019765lfb.126.1523024653046; 
	Fri, 06 Apr 2018 07:24:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Fri, 6 Apr 2018 07:24:12 -0700 (PDT)
In-Reply-To: <355BE46A91031048906B695426A8D8E61739229F@DEFTHW99EH4MSX.ww902.siemens.net>
References: <d08821dd-51e6-f69c-c2c4-27798bcb7794@siemens.com>
	<CADkTA4PmRh3uft80szZ7KqJU-V8wCcHpAAu6=3EFHcutWASHjA@mail.gmail.com>
	<CADkTA4MCvT_Pdx2BF67+yT9dg5XWnwqcSCi5=5YbK452X9Yf-A@mail.gmail.com>
	<355BE46A91031048906B695426A8D8E61739229F@DEFTHW99EH4MSX.ww902.siemens.net>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 6 Apr 2018 10:24:12 -0400
Message-ID: <CADkTA4N9ukUT_Nhpd2s5UeSU7SCB=M-BaWE=8fd8ihB8Vv3qWQ@mail.gmail.com>
To: "Bach, Pascal" <pascal.bach@siemens.com>
Cc: Raymond Danks <ray.danks@se-eng.com>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: docker-proxy links against host libraries
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
X-List-Received-Date: Fri, 06 Apr 2018 14:24:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 6, 2018 at 10:19 AM, Bach, Pascal <pascal.bach@siemens.com> wrote:
> Hi Bruce
>
>> -----Original Message-----
>> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
>> Sent: Freitag, 6. April 2018 14:47
>> To: Bach, Pascal (BT CPS R&D ZG FW CCP) <pascal.bach@siemens.com>
>> Cc: meta-virtualization@yoctoproject.org; Raymond Danks <ray.danks@se-
>> eng.com>
>> Subject: Re: docker-proxy links against host libraries
>>
>> On Fri, Apr 6, 2018 at 8:38 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
>> wrote:
>> > On Fri, Apr 6, 2018 at 7:48 AM, Pascal Bach <pascal.bach@siemens.com>
>> wrote:
>> >> Hello
>> >>
>> >> I observed some strange linking problem with the "docker-proxy" when
>> building for qemux86-64.
>> >>
>> >> It seems that the binary is linked against the host version of
>> >>
>> >> ```
>> >> $ file image/usr/bin/docker-proxy
>> >> image/usr/bin/docker-proxy: ELF 64-bit LSB executable, x86-64, version 1
>> (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, not
>> stripped
>> >>
>> >> ^^^^^^ ```
>> >>
>> >> I only noticed the issue on my build as it is a multi lib Debian where the
>> libraries are under /lib64 and /lib32.
>> >> However on the target there there is only /lib to the binary did not work
>> there.
>> >>
>> >> Only the docker-proxy binary is affected by this, the other binaries
>> (docker, dockerd) are fine.
>> >>
>> >> ```
>> >> $ file image/usr/bin/docker
>> >> image/usr/bin/docker: ELF 64-bit LSB executable, x86-64, version 1
>> >> (SYSV), dynamically linked, interpreter /lib/ld-linux-x86-64.so.2,
>> >> for GNU/Linux 3.2.0,
>> >> BuildID[sha1]=c118d2393c7932172ca3e183bb304fe1cff73ce5, not stripped
>> >> ```
>> >>
>> >> I tried to fix the recipe by replacing the build command for docker-proxy
>> [1] with the following line:
>> >>
>> >> ```
>> >> ${GO} build ${GOBUILDFLAGS} -o ${S}/src/import/docker-proxy
>> >> github.com/docker/libnetwork/cmd/proxy
>> >> ```
>> >>
>> >> But without success the linked loader is still wrong.
>> >>
>> >> It is also worth mentioning that this only happens with x86_64 builds
>> (tried: qemux86-64, genericx64-64) but not with other architectures like
>> armv7.
>> >> I was also able to reproduce this on poky master today (commit:
>> 9ed34e315a8d2db58e212b0770dfa8f4ad00f637).
>> >
>> >
>> > But what meta-virt commit is your head ?
>
> Sorry forgot to mention, I was using: e9d74162a9bfdbf0a51f230ad9bedeab920552f4
>
>> >>
>> >>
>> >> The only solution I found so far is to put the docker-proxy into a separate
>> recipe and add it as a RDEPENDS to docker.
>> >> I will submit a patch for this and you can decide if this would be an
>> acceptable solution.
>> >
>> > I don't see what a separate recipe has to do with a fix. I'd rather
>> > keep the build all in one place.
>> >
>> > I guess I can wait to see the recipe, but what's different in that
>> > recipe in the way that docker-proxy is built, that can't be done in
>> > the existing recipe ?
>> >
> I guess there is nothing that could not be done in the current recipe.
> However as the docker-proxy is a proper go package it can easily be built with a simple recipe using go.bbclass. So for me this was the simplest solution as I could not figure out how to call go build properly.

I think I have that sorted now, since the package provides a Makefile.
I had meant to switch to that when I uprev'd, but forgot :(

As I mentioned in my other email, if you can send me the good versus
bad link, then I can compare it to what I get now.

Bruce

>
>> I can see a similar link pattern here (but this would have been an existing
>> issue, unrelated to the recent docker uprevs), so I'll have a go at fixing it this
>> morning.
>
> The issue was already there before 18.03 uprev. So I don't think it is related.
> I was using pyro before with docker 1.1x something where I didn't notice the issue there.
>
> Pascal



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

