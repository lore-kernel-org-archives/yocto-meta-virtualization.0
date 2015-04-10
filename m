Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2B35EE0095C; Fri, 10 Apr 2015 06:52:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.173 listed in list.dnswl.org]
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A7D94E00930
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Apr 2015 06:52:56 -0700 (PDT)
Received: by ignm3 with SMTP id m3so14768889ign.0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Apr 2015 06:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=gSyvDiDtmWWO7Squ/fLSWcU16t2o9zmAKZT+yHWmFjY=;
	b=FyytLs9iy6JeU+Vz6letTJGIKdKconUgMlGy3sMv5e+IS68xcNAgRmkOTqZFLEzOCV
	Eam9TP//uBOzfKTsfhBW0YUPoGLG6Ztl8JmA2bnq764gljF9Mfzp0aVfWVVa1Rr2h9qB
	MC3uljUzCTznDWCWmkIUxUeD7n2l70Uvo79GcgxH6LR9/Ns800wuKnPUtv5pswy3vthR
	v4zAOUnMMyVrlhFmYcK0dXVAAihYBbgF/I2iz+AocuvbcRujwBp8TdRm14hVbGjd9g3m
	39i4GJb1Cpwyqasf0H/l3srzjEX9/6a2Xye4McANyEne482R/xtEg2N1RoKnEe9hcugL
	gL1g==
MIME-Version: 1.0
X-Received: by 10.50.78.199 with SMTP id d7mr4634586igx.18.1428673975703; Fri,
	10 Apr 2015 06:52:55 -0700 (PDT)
Received: by 10.107.158.20 with HTTP; Fri, 10 Apr 2015 06:52:55 -0700 (PDT)
In-Reply-To: <F9E85480F62349458DF67CE8BA000D8D4076D50F@DE08W1303.global.ds.honeywell.com>
References: <F9E85480F62349458DF67CE8BA000D8D4076D50F@DE08W1303.global.ds.honeywell.com>
Date: Fri, 10 Apr 2015 09:52:55 -0400
Message-ID: <CADkTA4NsatnZUvVxPZFap=O33LPkhTa0rLJwhE4oPSQ-07+tzw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Gotthard, Petr" <Petr.Gotthard@honeywell.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: interest to integrate virt-manager?
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
X-List-Received-Date: Fri, 10 Apr 2015 13:52:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2015 at 8:19 AM, Gotthard, Petr
<Petr.Gotthard@honeywell.com> wrote:
> Hello,
>
>
>
> I managed to build virt-manager (plus virt-viewer and the virt-* scipts) =
for
> Yocto, so I wonder if you would be interested to integrate the virt-manag=
er
> (and related bitbake recipes) into the meta-virtualization? Or is there
> another recommended graphical manager for KVM?

I'm definitely interested .. see below.

>
> https://virt-manager.org/
>
>
>
> New virt-manager releases unfortunately require python-pygobject 3.0, whi=
ch
> is (seems to be) not supported in Yocto (yet). I wanted to avoid the GObj=
ect
> Introspection (dependency on meta-gir), so I have scripts for virt-manage=
r
> 0.9.5 only, which is the latest GTK2 release. (It=E2=80=99s better than n=
othing.)

:)

We also have virt-manager recipes and uncompleted work here, it slammed
into g-i-r and stopped .. needing on target compilation to finish the packa=
ging
of virt-manager.

So I feel your pain!

At some point, we will need to figure this out, but having an older version=
 in
the tree until that happens makes a lot of sense.

I'll compare what you have versus those other changes, and see what we can
pull together.

>
>
>
> Shall I just post the .bb files (or a long list of patches), or would you
> prefer another approach? The virt-manager depends on gtk-vnc and few

Post the bb files. If you want to capture any significant points in
your development
history, feel free to split the patches. But otherwise, post a series that =
is
clean, and introduces the recipes from scratch directly to a working versio=
n.

> python-* packages that I also had to create. Should the new python-*
> packages required by virt-manager go also into meta-virtualization (as no
> one else is apparently using them), or shall these go into some other lay=
er?

Start them in meta-virt, for initial introduction I prefer to have
support python
libraries near the code that actually exercises them!

Bruce

>
>
>
> Please advise.
>
>
>
>
>
> Cheers,
>
> Petr
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



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

