Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 07F7BE0095F; Thu, 20 Apr 2017 08:10:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
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
	*      [209.85.216.176 listed in list.dnswl.org]
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C71C4E0083D
	for <meta-virtualization@yoctoproject.org>;
	Thu, 20 Apr 2017 08:10:23 -0700 (PDT)
Received: by mail-qt0-f176.google.com with SMTP id y33so47577059qta.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 20 Apr 2017 08:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/qkWnNTWFi6DglxlRK8Zh26HZysmybaJGABYxE/mgqE=;
	b=tRBmMj8oMC1W14sUa7H+cK7THxikLG+QYISTV/sIEV3M5kOYm4asjNpPNZ+Jlvft8H
	nmsNP5yZA8uEwWh8fLhFyYuPJDWuD2AHndJCnjfU0vz1t6GuBp0EeGvyfj/J5pwWgAG4
	GuA9tVSH0aBwxktc2vaEog1jUbhnn9+cQYojB24OEX3u/GDO32aLpzkio0YrlhKkXK84
	ztVgXs4IC+Jb1Mf9UIzSbguaq8/ZIga2K2g3paIOIvclhrjaKcQQzQKDo91tbOlheusk
	ayIcjQr90zcugE2/bEx9EyJYHEy28UGWeizlZFnk9SG0BeQOS4QImvCz4AiJDGkHUNMT
	elug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/qkWnNTWFi6DglxlRK8Zh26HZysmybaJGABYxE/mgqE=;
	b=Pgzpvg3IEaR/HMxvsjXMS3BX3r+hR7hWSC+jwzD4k0zHIwvmzWF3LCL0HDZkNwAJ1L
	fGlXnQGa24d6fxfBfEaJZvT+/RCgwsepU9V9E85Yc4NZLQGqndADaYhA2DbxSOUlhQe8
	fn2CpISjRlntTvJiLIOeuB1HKAUhr5ctQX6wYDPlbr+zPRcprhJ0H+ecjbaP97Hy9Y5O
	ICkVjeg+zuGo3gAxNI2+HcTjNmPNNw90MySZbwRTk1/BN6soIRDMkW1ixvL4kA3Lp9Ra
	nonif055E6gaFqGOI0CbwGZKRHZnjuHITNEQD+oGOptydMOeNZahjRcdcY14lIoDPbeZ
	IuPw==
X-Gm-Message-State: AN3rC/6iVdOmvaLyZ9uld1cKK+OhdSLdEMTIWi5jqf6u+JaxyzNcFduf
	6IFPTUpdade+Lq1aPvradle5/E4x1A==
X-Received: by 10.237.35.162 with SMTP id j31mr8295643qtc.117.1492701022652;
	Thu, 20 Apr 2017 08:10:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Thu, 20 Apr 2017 08:10:22 -0700 (PDT)
In-Reply-To: <CADM9VctCY=M2_HeiXh-e7CqZ2cibt2V3mUFGhe7xHJ=Zevi7iA@mail.gmail.com>
References: <CADM9VctCY=M2_HeiXh-e7CqZ2cibt2V3mUFGhe7xHJ=Zevi7iA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 20 Apr 2017 11:10:22 -0400
Message-ID: <CADkTA4N6_OQwYVyH1qZAyMzRwBHxhpJNshxbjumkuhvcvWmVRw@mail.gmail.com>
To: Massimiliano Malisan <max.malisan.uk@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: LXD anyone?
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
X-List-Received-Date: Thu, 20 Apr 2017 15:10:27 -0000
Content-Type: multipart/alternative; boundary=001a113e7f54360f74054d9a8a35

--001a113e7f54360f74054d9a8a35
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 20, 2017 at 10:00 AM, Massimiliano Malisan <
max.malisan.uk@gmail.com> wrote:

> Hi all,
>
> is anyone currently working on creating a recipe for LXD?
>

We started creating one about a year ago (and it was discussed, but I can't
find a reference now) .. but that effort never did make it into the tree
and has bit rotted now.

So if you have something underway, and are looking for input, feel free to
post RFC patches and we can see what's working (or not!).

Cheers,

Bruce


>
> I have been working on one in the last days but I still have some issues
> to have it run properly; being quite new to Yocto I am not sure if they
> depend on something in my recipe or some other missing dependency or
> configuration, so any other voice is more than welcome.
>
> Cheers,
>     Max
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113e7f54360f74054d9a8a35
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Apr 20, 2017 at 10:00 AM, Massimiliano Malisan <span dir=3D"ltr=
">&lt;<a href=3D"mailto:max.malisan.uk@gmail.com" target=3D"_blank">max.mal=
isan.uk@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div dir=3D"ltr"><div>Hi all,=C2=A0<br></div><div><br></div><div>is anyone c=
urrently working on creating a recipe for LXD?<br></div></div></blockquote>=
<div><br></div><div>We started creating one about a year ago (and it was di=
scussed, but I can&#39;t find a reference now) .. but that effort never did=
 make it into the tree and has bit rotted now.<br></div><div><br></div><div=
>So if you have something underway, and are looking for input, feel free to=
 post RFC patches and we can see what&#39;s working (or not!).</div><div><b=
r></div><div>Cheers,</div><div><br></div><div>Bruce</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div></div><div><br></div><d=
iv>I have been working on one in the last days but I still have some issues=
 to have it run properly; being quite new to Yocto I am not sure if they de=
pend on something in my recipe or some other missing dependency or configur=
ation, so any other voice is more than welcome.</div><div><br></div><div>Ch=
eers,</div><div>=C2=A0 =C2=A0 Max</div></div>
<br>--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
<br></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div cla=
ss=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt =
not follow the NULL pointer, for chaos and madness await thee at its end&qu=
ot;</div>
</div></div>

--001a113e7f54360f74054d9a8a35--
