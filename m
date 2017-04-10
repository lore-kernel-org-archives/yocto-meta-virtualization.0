Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2E7A2E00924; Mon, 10 Apr 2017 05:48:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.175 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.175 listed in dnsbl.sorbs.net]
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 014C1E00924
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Apr 2017 05:48:25 -0700 (PDT)
Received: by mail-qk0-f175.google.com with SMTP id p68so83996299qke.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Apr 2017 05:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nW0vkU7UnsiqHHkrzPVgZrYREQ8RMvcWHcEY8q7GTWY=;
	b=hTrXE8T379ToK2DDe5xx/9c8lggc9DCgwq0sk60/W5MQ9V/+6td1B54dDr/0Boc1Dq
	tDl0LLUBOtEXEHlVMKg5IJUTFmGHcqsXptbNGBaMbRt53H8RLqCg1YpmICVthW8RUPqS
	ALZ3iBF0dIX6CQYWixgeo5C8W9MRpoCsMJj3micT+cIkUtqMgYVO/6x99awIM5Sqqeq4
	wI5AapEkqJgxkJfTKWG0OSb9e/GY+LhIAs1GKakT554STHcP8w7RJ904owFif9iL8t32
	foDmyjm6Oz2k556F1CDOZkGwtEqkRa9Xf3JNZ5Dm0SE29OSBrz2dV4tpmd/pGoyR0TqB
	ui+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nW0vkU7UnsiqHHkrzPVgZrYREQ8RMvcWHcEY8q7GTWY=;
	b=SEwF5ZhPW6pxgLKTHNGgoBdz31J+jCHv1O88mUYvoQGvp/qsIyBxV0FHu6ZWBHepbx
	U33qu1a4UAX7z7zyOo1SdmgK6BrH41I3plAWwfHXYBm7dQ5ux2XYPByk1uZKpb+091Lt
	+Z52qhOqHvM7ADntTVijCa7wslesJujUL0m7hqceX5fXVmi4e0eUa4WbALYOv1q+1XHh
	z0b0xc6wgvNziPNgwad6xGmr0A6D2hfHAdUlPWpok7qnyXgX8KtfZyPv5AKWE7iSSAfU
	jKdeE7Nwbqu6j1AIrVmDYsMPBBldEcHHD9ePfvXXj8PW5SsfPQ3iadXb1akfZwG66hBy
	PRyg==
X-Gm-Message-State: AFeK/H2hK+16D66Zj3cDbw7WO4jb8ru/m2rlXstli9aVWQKjyPHZl1najRZi1NZY3X8fI5gNmvbH1o9XNNS6Dg==
X-Received: by 10.55.23.216 with SMTP id 85mr42702715qkx.157.1491828504624;
	Mon, 10 Apr 2017 05:48:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Mon, 10 Apr 2017 05:48:24 -0700 (PDT)
In-Reply-To: <20170403102713.1536-1-pbarker@toganlabs.com>
References: <20170403102713.1536-1-pbarker@toganlabs.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 10 Apr 2017 08:48:24 -0400
Message-ID: <CADkTA4PU8-cOV+WGwg5xKsKef9vdaAhL1yLpGYXiij7qmJ-oEA@mail.gmail.com>
To: Paul Barker <pbarker@toganlabs.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 0/4] Updates for runc & associated tools
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
X-List-Received-Date: Mon, 10 Apr 2017 12:48:29 -0000
Content-Type: multipart/alternative; boundary=001a1147a2f815829a054ccf64bc

--001a1147a2f815829a054ccf64bc
Content-Type: text/plain; charset=UTF-8

Sorry for the delay, I was traveling and didn't get a chance to test these
until
now.

Everything worked and I've merged all but the branch spec patch

Bruce

On Mon, Apr 3, 2017 at 6:27 AM, Paul Barker <pbarker@toganlabs.com> wrote:

> I've finally got back to playing around with runc and associated tools :)
>
> These patches have been tested on a raspberrypi3 and allow successful
> creation
> of a guest container using runc, netns and cgroup-lite.
>
> Paul Barker (4):
>   netns: Update to latest HEAD
>   runc-opencontainers: Update to v1.0.0-rc3
>   runc-opencontainers: Drop unnecessary branch spec from SRC_URI
>   cgroup-lite: Inherit allarch
>
>  recipes-containers/cgroup-lite/cgroup-lite_1.11.bb |  1 +
>  recipes-containers/runc/runc-opencontainers_git.bb | 14 ++++++++++----
>  recipes-networking/netns/netns_git.bb              |  8 ++++----
>  3 files changed, 15 insertions(+), 8 deletions(-)
>
> --
> 2.11.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1147a2f815829a054ccf64bc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Sorry for the delay, I was traveling and didn&#3=
9;t get a chance to test these until<br></div>now.<br><br></div><div>Everyt=
hing worked and I&#39;ve merged all but the branch spec patch<br><br></div>=
<div>Bruce<br></div><div><div><div><div><div class=3D"gmail_extra"><br><div=
 class=3D"gmail_quote">On Mon, Apr 3, 2017 at 6:27 AM, Paul Barker <span di=
r=3D"ltr">&lt;<a href=3D"mailto:pbarker@toganlabs.com" target=3D"_blank">pb=
arker@toganlabs.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>I&#39;ve finally got back to playing around with runc and associated tools=
 :)<br>
<br>
These patches have been tested on a raspberrypi3 and allow successful creat=
ion<br>
of a guest container using runc, netns and cgroup-lite.<br>
<br>
Paul Barker (4):<br>
=C2=A0 netns: Update to latest HEAD<br>
=C2=A0 runc-opencontainers: Update to v1.0.0-rc3<br>
=C2=A0 runc-opencontainers: Drop unnecessary branch spec from SRC_URI<br>
=C2=A0 cgroup-lite: Inherit allarch<br>
<br>
=C2=A0recipes-containers/cgroup-<wbr>lite/<a href=3D"http://cgroup-lite_1.1=
1.bb" rel=3D"noreferrer" target=3D"_blank">cgroup-lite_1.11.bb</a> |=C2=A0 =
1 +<br>
=C2=A0recipes-containers/runc/<a href=3D"http://runc-opencontainers_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">runc-<wbr>opencontainers_git.bb</a> |=
 14 ++++++++++----<br>
=C2=A0recipes-networking/netns/<a href=3D"http://netns_git.bb" rel=3D"noref=
errer" target=3D"_blank">netns<wbr>_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++++----<br>
=C2=A03 files changed, 15 insertions(+), 8 deletions(-)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.11.0<br>
<br>
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
</div></div></div></div></div></div>

--001a1147a2f815829a054ccf64bc--
