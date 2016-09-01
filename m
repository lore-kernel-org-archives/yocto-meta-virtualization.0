Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1E473E00CA1; Wed, 31 Aug 2016 17:37:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.216.193 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  1.0 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.193 listed in dnsbl.sorbs.net]
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E01F0E00C92
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 Aug 2016 17:37:20 -0700 (PDT)
Received: by mail-qt0-f193.google.com with SMTP id c52so2332577qte.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 Aug 2016 17:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZCnwghT+p26hgIPUfZD/kF2WS7tYIqMwqktgG2fCl9w=;
	b=CxJud2hnMc9LibNU5Hqj7hMAoUtwc1MxF0SwJ9iEoA+sY9ySk/IHhD+MUQL19qkwls
	8VRUg4fBbNPY95GavyjVE497xGfGfEIOl1VkcJics53NbpVXie1ZGg0YoeZWGDftfgmy
	W6rqqMshUZOS+jIAgZLVTtTomErjD9h+1Xec3YCuZrhb+LXqCq146f2qnHaPbuW2p2Z+
	/PdZ5SA3TVvjoaKbEB13CpiECN6smyKz4BNDa9EGgwq7bsGAwMlz8tEdRWniCiSsbrGY
	9dpMB6IMulaJk3K1K0cpTMOmCUXTWjbYzEm6JF851jcSPi1xFno28u/wXGHr4eQyOuPN
	N55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZCnwghT+p26hgIPUfZD/kF2WS7tYIqMwqktgG2fCl9w=;
	b=DuQlNSrJkRIv0gXHuZGIM+WjXz7CuTqGJjzGFQp1yvBdnPE+M5TrSbDrluGKNyCm2K
	1gRvPgJv2I3w3R6W8RPgOzyVSs54TN5eJdd47rdWTdQ9hwEvCN+JL9AknBBnlSXoSKi5
	wn4QVexLIXM637gOClC91i1WR4ap5L0747NEYJBia94U50QGO4lvpVWrXrZRoHgMwDVv
	KTpaxkjVQ39yOPphqqT552WuVwXi9sywx4RFF4SI8Yn88Hdq4NJNaDPQ5v0v3Bf104MF
	9JZNtLkItdxYzvg8KJgngai78KVzDQiklMI3Ovrn5/fKxNQ+YiVhGZrPxcm1sglzRNI8
	HktA==
X-Gm-Message-State: AE9vXwOE/FqGnCf0iRU08zaZFvzimQ44ygQnkNdcou4D/F8nVEI8XQkihq157g9fQPBpIsZ00kvcoHPVQGdyDQ==
X-Received: by 10.200.33.183 with SMTP id 52mr14542558qty.128.1472690239950;
	Wed, 31 Aug 2016 17:37:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.53.83 with HTTP; Wed, 31 Aug 2016 17:37:18 -0700 (PDT)
In-Reply-To: <7329396.TWHmj0FE8o@peggleto-mobl.ger.corp.intel.com>
References: <1472667583-9767-1-git-send-email-mark.asselstine@windriver.com>
	<CADkTA4NhdqBgHBaSrGrYV-hKH15P8ro6g74GGu=DrEBcSMQWzw@mail.gmail.com>
	<CADkTA4P1D9_QqsweNfQPFWkKG4E-XwsE-GoQns9=_ipx0SD1eA@mail.gmail.com>
	<7329396.TWHmj0FE8o@peggleto-mobl.ger.corp.intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 31 Aug 2016 20:37:18 -0400
Message-ID: <CADkTA4Np5d+kKWHYmD1sWDQ8yUrZ9qeaGjZXcrBA4GSFECX3KQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Mark Asselstine <mark.asselstine@windriver.com>
Subject: Re: [PATCH 2/2] docker: update license md5sum
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
X-List-Received-Date: Thu, 01 Sep 2016 00:37:22 -0000
Content-Type: multipart/alternative; boundary=001a113fde429dd4d4053b676a1e

--001a113fde429dd4d4053b676a1e
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 31, 2016 at 6:28 PM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Wed, 31 Aug 2016 17:17:00 Bruce Ashfield wrote:
> > On Wed, Aug 31, 2016 at 5:13 PM, Bruce Ashfield <
> bruce.ashfield@gmail.com>
> > wrote:
> > > I just did a cleanall and re-build. The checksum matches.
> >
> > ... and I just realized that cleanall doesn't get sstate, so I'd better
> > remove that as well!
>
> Just to clear up any confusion, -c cleanall *will* delete sstate artifacts
> in
> your local sstate-cache, since the do_cleanall task depends on
> do_cleansstate.
> However, if you are using SSTATE_MIRRORS pointing to a mirror server and
> that
> contains matching artifacts there's no way for those to be removed from the
> bitbake side - though if you need to you can alter the signatures by using
> -c <task> -f / -C <task> (or just making a trivial change to the metadata)
> and
> then those artifacts won't be used.
>

Right. I was getting them pulled from a mirror, which I disabled. Thanks
for
clarification, otherwise someone would search this up later and blame me
for leading them wrong :D

Bruce


>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113fde429dd4d4053b676a1e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Aug 31, 2016 at 6:28 PM, Paul Eggleton <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggle=
ton@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><span class=3D"">On Wed, 31 Aug 2016 17:17:00 Bruce Ashfield wrote:<br>
&gt; On Wed, Aug 31, 2016 at 5:13 PM, Bruce Ashfield &lt;<a href=3D"mailto:=
bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; wrote:<br>
</span><span class=3D"">&gt; &gt; I just did a cleanall and re-build. The c=
hecksum matches.<br>
&gt;<br>
&gt; ... and I just realized that cleanall doesn&#39;t get sstate, so I&#39=
;d better<br>
&gt; remove that as well!<br>
<br>
</span>Just to clear up any confusion, -c cleanall *will* delete sstate art=
ifacts in<br>
your local sstate-cache, since the do_cleanall task depends on do_cleanssta=
te.<br>
However, if you are using SSTATE_MIRRORS pointing to a mirror server and th=
at<br>
contains matching artifacts there&#39;s no way for those to be removed from=
 the<br>
bitbake side - though if you need to you can alter the signatures by using<=
br>
-c &lt;task&gt; -f / -C &lt;task&gt; (or just making a trivial change to th=
e metadata) and<br>
then those artifacts won&#39;t be used.<br></blockquote><div><br></div><div=
>Right. I was getting them pulled from a mirror, which I disabled. Thanks f=
or=C2=A0</div><div>clarification, otherwise someone would search this up la=
ter and blame me=C2=A0</div><div>for leading them wrong :D</div><div><br></=
div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
Paul<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--001a113fde429dd4d4053b676a1e--
