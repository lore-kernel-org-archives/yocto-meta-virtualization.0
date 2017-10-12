Return-Path: <limon.anibal@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ABB8AE00CD3; Thu, 12 Oct 2017 05:51:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (limon.anibal[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.51 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.51 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53963E00CC6
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Oct 2017 05:51:30 -0700 (PDT)
Received: by mail-wm0-f51.google.com with SMTP id l68so13051564wmd.5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Oct 2017 05:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pBOQVDOM3fd8oh8TVvZEEqQmSDRW7g0GE4BBVNttI8Q=;
	b=eB0F8k8aWu2m3MK+PkBCdvcQZFM6T25V4eOuji8Wfj8SH4qCvCdY9D18/swW/kqkqf
	VoEwniz4jOOA4ldQ9rxsxkyfeBwuATWijy7DklRUn82cDTK5u//3jG+NvNonkefA0lCy
	UytiVbgY4AhrgZpn3rySKWeHXjgwV+1g17oYc4sn+2S2FLtAz4vMJKc5//YzSF3+tCAL
	ZkyTIJZc8tFavCZP2BPa/L3LBg4HXjaz+37UtuVeZYAupCutKl/Y8IRnAlRe/uL+DNKa
	eFXcTFjnMfdNqPO2pxS0z/1YVhsTBLdh8Kib3rjJEf1PfMUeWZprKve/GsYuSwENXC0a
	3SSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pBOQVDOM3fd8oh8TVvZEEqQmSDRW7g0GE4BBVNttI8Q=;
	b=uhxs5DoWvji0a7+sG1oAuH1Q1ywZZA7nYwlVf6FTnZG2kJLhjrGUVSQliyxxc7rjG6
	j/lho+gKJSdPQtE6CNhzBwE8DXBxObNxyvQ6LRGc5ILU/rvk88MUvX28ZTMLmWZX1RST
	xM88JRi32P4m9xJBIzeQHP+JOXHycj//cr1dLjpq1Lwsth0VGGSr3StC0CsFnGjGolJk
	IgL3JnTz2a8JD2ZTMG2ImAzZJsc6sYmOXvTwFOevmhoCjXcVu3C0UM0Op7wwI7sXNzUR
	ZMRBhWxoW7kJss9Pcih+uxZ9DMH+KKy9t2o56N4f3/B12dLxsGsyCLYM9nKfuJVyoX7e
	AnLg==
X-Gm-Message-State: AMCzsaXoMHsNhoxSaT7LrMxh0FyXBS9bcdqtiR6iB6cP0N9Cf19/5kyr
	3fNt8yZgmQmyMoZDNr+G8SZ08RQSMbkU2zbp7C0=
X-Google-Smtp-Source: AOwi7QCeA9NQpYd393e8jfbCYar6lHlgN3rbclBVBeEzI44dgrRgvUBbQbjOZ0qZ+8RKLUNCjsmu3empENKKmMUvjdU=
X-Received: by 10.80.166.209 with SMTP id f17mr2839569edc.278.1507812688324;
	Thu, 12 Oct 2017 05:51:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.142.72 with HTTP; Thu, 12 Oct 2017 05:51:27 -0700 (PDT)
In-Reply-To: <CAPyrkgyBvPgL+SwSqX5RcjSn+DPFKGfPVfmkCt5=8qqDO-BUBw@mail.gmail.com>
References: <20171009195421.17393-1-limon.anibal@gmail.com>
	<CAPyrkgxJLawo+vREn_HoV9FjLX6s4gz0+2952A75uCmhur+nwg@mail.gmail.com>
	<CADkTA4Mxe=+hQjSmWGCzC97ftaM=52dsMxyevowELySZTaNg4g@mail.gmail.com>
	<CAPyrkgzg7bk91F6otNxD7hsup1sp1WMzoED9UNorJa-zEeS_HA@mail.gmail.com>
	<CAPyrkgyBvPgL+SwSqX5RcjSn+DPFKGfPVfmkCt5=8qqDO-BUBw@mail.gmail.com>
From: =?UTF-8?Q?Anibal_Lim=C3=B3n?= <limon.anibal@gmail.com>
Date: Thu, 12 Oct 2017 07:51:27 -0500
Message-ID: <CAPS-YPBWQvambiNWdo0u=xvkJMu0wWf+7ybO=OZV1is9PaXG5w@mail.gmail.com>
To: Paul Barker <pbarker@toganlabs.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linaro.org>
Subject: Re: [PATCH] Revert "runc: Don't override GOARCH or GOROOT"
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
X-List-Received-Date: Thu, 12 Oct 2017 12:51:31 -0000
Content-Type: multipart/alternative; boundary="94eb2c198f2aaceb5d055b58ff5d"

--94eb2c198f2aaceb5d055b58ff5d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2017 at 6:58 AM, Paul Barker <pbarker@toganlabs.com> wrote:

> On Tue, Oct 10, 2017 at 12:30 AM, Paul Barker <pbarker@toganlabs.com>
> wrote:
> > On Tue, Oct 10, 2017 at 12:02 AM, Bruce Ashfield
> > <bruce.ashfield@gmail.com> wrote:
> >> On Mon, Oct 9, 2017 at 5:56 PM, Paul Barker <pbarker@toganlabs.com>
> wrote:
> >>>
> >>> It seems like we have conflicting changes :( Reverting this patch wil=
l
> >>> break cross-compilation of runc-opencontainers for x86-64 with musl
> >>> libc again.
> >>>
> >>> I'll try cross-compiling both runc variants for arm, aarch64, x86 and
> >>> x86-64 and see if I can find a solution that works for everything.
> >>>
> >>
> >> Agreed.
> >>
> >> I'll hold off on any revert until I hear from your tests.
> >>
> >> For the configs I'm using everything is building with the current set
> >> of changes.
> >>
> >> Bruce
> >>
> >
> > I can re-produce the failure by building runc-docker for
> > raspberrypi3-64. However, runc-opencontainers builds successfully for
> > raspberrypi3-64. So at worst we can add a do_compile_prepend() in the
> > recipe for runc-docker (but not the common .inc file). However, the
> > whole thing looks wrong, GOROOT shouldn't be pointing at the native
> > sysroot at all. There's probably something strange going on in the
> > runc-docker makefile.
> >
>
> I've found that the issue is with building the recvtty demo/reference
> application within runc-docker. That's under a contrib directory in
> the source tree and isn't a core part of the runc application. If I
> patch out the line in the Makefile which builds recvtty then the build
> succeeds for all platforms I build tested (qemux86, qemux86-64,
> raspberrypi, raspberrypi2, raspberrypi3, raspberrypi3-64).
>
> So I'm going to propose we just patch out the compilation of recvtty
> for this recipe unless someone is actually using it. An=C3=ADbal, is this
> ok for you?
>

Hi Paul,

For me is ok, i think the recvtty makefile needs to be fixed but since is a
demo application i don't see any problem to disable the build of it.

Cheers,
Anibal

>
> Thanks,
>
> --
> Paul Barker
> Tog=C3=A1n Labs Ltd
>

--94eb2c198f2aaceb5d055b58ff5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Oct 12, 2017 at 6:58 AM, Paul Barker <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:pbarker@toganlabs.com" target=3D"_blank">pbarker@toganlabs.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">=
On Tue, Oct 10, 2017 at 12:30 AM, Paul Barker &lt;<a href=3D"mailto:pbarker=
@toganlabs.com">pbarker@toganlabs.com</a>&gt; wrote:<br>
&gt; On Tue, Oct 10, 2017 at 12:02 AM, Bruce Ashfield<br>
&gt; &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.c=
om</a>&gt; wrote:<br>
&gt;&gt; On Mon, Oct 9, 2017 at 5:56 PM, Paul Barker &lt;<a href=3D"mailto:=
pbarker@toganlabs.com">pbarker@toganlabs.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
</span><span class=3D"">&gt;&gt;&gt; It seems like we have conflicting chan=
ges :( Reverting this patch will<br>
&gt;&gt;&gt; break cross-compilation of runc-opencontainers for x86-64 with=
 musl<br>
&gt;&gt;&gt; libc again.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I&#39;ll try cross-compiling both runc variants for arm, aarch=
64, x86 and<br>
&gt;&gt;&gt; x86-64 and see if I can find a solution that works for everyth=
ing.<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Agreed.<br>
&gt;&gt;<br>
&gt;&gt; I&#39;ll hold off on any revert until I hear from your tests.<br>
&gt;&gt;<br>
&gt;&gt; For the configs I&#39;m using everything is building with the curr=
ent set<br>
&gt;&gt; of changes.<br>
&gt;&gt;<br>
&gt;&gt; Bruce<br>
&gt;&gt;<br>
&gt;<br>
&gt; I can re-produce the failure by building runc-docker for<br>
&gt; raspberrypi3-64. However, runc-opencontainers builds successfully for<=
br>
&gt; raspberrypi3-64. So at worst we can add a do_compile_prepend() in the<=
br>
&gt; recipe for runc-docker (but not the common .inc file). However, the<br=
>
&gt; whole thing looks wrong, GOROOT shouldn&#39;t be pointing at the nativ=
e<br>
&gt; sysroot at all. There&#39;s probably something strange going on in the=
<br>
&gt; runc-docker makefile.<br>
&gt;<br>
<br>
</span>I&#39;ve found that the issue is with building the recvtty demo/refe=
rence<br>
application within runc-docker. That&#39;s under a contrib directory in<br>
the source tree and isn&#39;t a core part of the runc application. If I<br>
patch out the line in the Makefile which builds recvtty then the build<br>
succeeds for all platforms I build tested (qemux86, qemux86-64,<br>
raspberrypi, raspberrypi2, raspberrypi3, raspberrypi3-64).<br>
<br>
So I&#39;m going to propose we just patch out the compilation of recvtty<br=
>
for this recipe unless someone is actually using it. An=C3=ADbal, is this<b=
r>
ok for you?<br></blockquote><div><br></div><div>Hi Paul,</div><div><br></di=
v><div>For me is ok, i think the recvtty makefile needs to be fixed but sin=
ce is a=C2=A0</div><div>demo application i don&#39;t see any problem to dis=
able the build of it.=C2=A0</div><div>=C2=A0</div><div>Cheers,</div><div>An=
ibal</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
<br>
Thanks,<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
Paul Barker<br>
Tog=C3=A1n Labs Ltd<br>
</div></div></blockquote></div><br></div></div>

--94eb2c198f2aaceb5d055b58ff5d--
