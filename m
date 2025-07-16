Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F60FC83F22
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 13:20:56 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.21951.1752672051545436053
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 16 Jul 2025 06:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BTkjO1J5;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-74931666cbcso5293250b3a.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Jul 2025 06:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752672051; x=1753276851; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UuUQn+JnZmBCwoLdT/eiFvabx0lF5UiUz7gs3k4EtI0=;
        b=BTkjO1J5EEnnvv2KFq+wYYYWXjEyc+OkseT4UUIEvKLfpEf05Qp8BnNcbUqpRQd0FT
         fYXTAGzjtcoRgThZJAfBXFSqEzA8TnV/lUG+MjuiFeNoeCyrpSGzXCx7+Q7QAPx9ngp/
         Xb/8nWnukkCcQ3Eh1iXXP9rGmxmhaTS1kzqd8y7lBzSuzh9y6pwCiHeFGOe/xQ+ehH8+
         cgT8szRp78J3JL7LgwhfAmP2h51ZS76aDU0+BsR2j83lSBav46u7YI7LpyX+TcVAi8Zn
         jS5Ny70Uy409pMxBt5mNXslo9qbAz0EngYglNj7xJTmZl6EAUvyjBQIDBGbtgyolQsU1
         KBYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752672051; x=1753276851;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UuUQn+JnZmBCwoLdT/eiFvabx0lF5UiUz7gs3k4EtI0=;
        b=i5umVswXnJoEIVshW6kLqAeKHm0FERwLEFrZCfPgQc/vyTZgcE/Q+BX1c+5GbWDhF+
         PRqAq7sPFcBLtYT0H3Ub+ybrSPe0SHxigDG+cEwgQKqBMmWZtlz7LoBb3EowOsMo3N79
         VXNj9s/HAbVsyQZj+ljbYZEoUIrdCYVVOUibJAgmk146NPPO9z02TucTfgEKq9dKZ7pJ
         ANsrGS0Zg9PTi54YOhJoWcVBbKDkZlCYvnoFz2BwgVfg58pr8px+Lab1ltCDrsdfJVWv
         gPjt1lgb4dXXEZEEbohbUXEhNa2gkYGH5Ij+gJemIjAYoPwTmZUNHF40FdjWETN8xTkS
         of2Q==
X-Gm-Message-State: AOJu0YyyMCui7/iYWMEbzzqMmgCgP022Ft9SzRn+ajDT85MFtDNr/ysp
	hoTZFZR9NJEdeztdKibNwlM6V2aj4LS5Blexed1JZlI5uQFcWsFrLs6nxjew4P3BL0NiFJwkvF+
	jBOcKGSygDyhR+byFKKUrMdMvAQrprVk=
X-Gm-Gg: ASbGncv20rqKKlVH7Bl0lTbTYHr7wFQBXQ0Hf83idpcmg/YgJ8SbhHpsA24j4v3yk8W
	m5/IgJgRieWDME5/jIidZz8winIbJHv1uBVs7Ct0rGP/SHGRwCUwJQHwxlp2vyNGVsqXL+7y0l/
	TJ9fR/dwI5g9thTBue3bHJBIa9yhAJGjpR5felY4I15K3ICFWMpHTp/GgCQxyEOo3P+99hq/uAA
	cX2u34u
X-Google-Smtp-Source: AGHT+IEslxD3jImZe6cyUsEoYUbsTAVtonOexPsBGnLKXOyXswoxNBmcp8MVPHuX7cj8rziAtE80fVPlO2owwpmzLws=
X-Received: by 2002:a17:90b:2d85:b0:312:51a9:5d44 with SMTP id
 98e67ed59e1d1-31c9e6ed862mr4357377a91.5.1752672050544; Wed, 16 Jul 2025
 06:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250716055943.446042-1-Qi.Chen@windriver.com>
In-Reply-To: <20250716055943.446042-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 16 Jul 2025 09:20:41 -0400
X-Gm-Features: Ac12FXy_c-Lx7obI7JhqjIMDYvBqp-jYfzyGRzjq8_E8xZWI1HvGRiTEPYyyCEM
Message-ID: <CADkTA4Mk+4ihsLWHboC0_iLNEgkZdb8R+Wkh54JADtn0yhPZRg@mail.gmail.com>
Subject: Re: [meta-virtualization][m-c-s][PATCH] meta-cloud-services: remove
 invalid S settings
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000fb04a4063a0bc245"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Jul 2025 13:20:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9310

--000000000000fb04a4063a0bc245
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 2:00=E2=80=AFAM Chen Qi via lists.yoctoproject.org =
<Qi.Chen=3D
windriver.com@lists.yoctoproject.org> wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
>
> Due to recent oe-core's change about UNPACKDIR/S, these settings
> are no longer valid and are causing errors.
>
> The git fetcher in bitbake now defaults to fetch git source to
> be under /${BP} instead of /git. So using '/git' is no longer valid.
>
> In addition, S now locates under ${UNPACKDIR} instead of ${WORKDIR}.
>
> So the default value of S (S =3D "${UNPACKDIR}/${BP}" from bitbake.conf)
> is already enough and do not need any further settings for these git
> recipes.
>


Ooops. My mistake on this, I was so busy doing the package uprevs in
meta-virt,
that I forgot to commit and push my changes to m-c-s.

I'll check mine against this and take care of it shortly.

Bruce



>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-connectivity/consul/consul-migrate_git.bb          | 1 -
>  recipes-connectivity/consul/consul_git.bb                  | 1 -
>  recipes-connectivity/serf/hashicorp-serf_0.9.4.bb          | 1 -
>  recipes-devtools/python/python-ansible.inc                 | 1 -
>  recipes-support/puppet-vswitch/puppet-vswitch_git.bb       | 1 -
>  recipes-support/puppetlabs-stdlib/puppetlabs-stdlib_git.bb | 1 -
>  recipes-support/ruby-shadow/ruby-shadow_git.bb             | 1 -
>  7 files changed, 7 deletions(-)
>
> diff --git a/recipes-connectivity/consul/consul-migrate_git.bb
> b/recipes-connectivity/consul/consul-migrate_git.bb
> index 1393c912..3c9518ee 100644
> --- a/recipes-connectivity/consul/consul-migrate_git.bb
> +++ b/recipes-connectivity/consul/consul-migrate_git.bb
> @@ -7,7 +7,6 @@ GO_IMPORT =3D "github.com/hashicorp/consul-migrate"
>  SRC_URI =3D "https://${GO_IMPORT}.git;branch=3Dmaster"
>  SRCREV =3D "678fb10cdeae25ab309e99e655148f0bf65f9710"
>
> -S =3D "${WORKDIR}/git"
>
>  SRCREV_raft =3D "057b893fd996696719e98b6c44649ea14968c811"
>  SRCREV_go-metrics =3D "f303b03b91d770a11a39677f1d3b55da4002bbcb"
> diff --git a/recipes-connectivity/consul/consul_git.bb
> b/recipes-connectivity/consul/consul_git.bb
> index 0d084b0d..3dceb9d8 100644
> --- a/recipes-connectivity/consul/consul_git.bb
> +++ b/recipes-connectivity/consul/consul_git.bb
> @@ -10,7 +10,6 @@ SRC_URI =3D
> "git://${GO_IMPORT}.git;branch=3Dmain;protocol=3Dhttps \
>             file://consul.service \
>            "
>
> -S =3D "${WORKDIR}/git"
>
>  RDEPENDS:${PN}-dev:append =3D " bash"
>
> diff --git a/recipes-connectivity/serf/hashicorp-serf_0.9.4.bb
> b/recipes-connectivity/serf/hashicorp-serf_0.9.4.bb
> index 8318400d..e46acbdc 100644
> --- a/recipes-connectivity/serf/hashicorp-serf_0.9.4.bb
> +++ b/recipes-connectivity/serf/hashicorp-serf_0.9.4.bb
> @@ -22,7 +22,6 @@ SRC_URI =3D
> "git://${GO_IMPORT}.git;protocol=3Dhttps;branch=3Dmaster"
>  PV =3D "0.8.5+git${SRCPV}"
>  SRCREV =3D "1d3fdf93bbe5002c5023da50402368a817488691"
>
> -S =3D "${WORKDIR}/git"
>
>  inherit go
>
> diff --git a/recipes-devtools/python/python-ansible.inc
> b/recipes-devtools/python/python-ansible.inc
> index 4bb90cb7..737daa9a 100644
> --- a/recipes-devtools/python/python-ansible.inc
> +++ b/recipes-devtools/python/python-ansible.inc
> @@ -10,7 +10,6 @@ SRC_URI =3D "git://
> github.com/ansible/ansible.git;protocol=3Dhttps;branch=3Dstable-2.1
>
>  SRCREV =3D "dc0e3bd16cc7ded081bc46c88e4e3d1997ca9bb0"
>
> -S =3D "${WORKDIR}/git"
>
>  ANSIBLE_WHITELIST_MODULES ?=3D "commands files system network/ovs
> __pycache__ service"
>
> diff --git a/recipes-support/puppet-vswitch/puppet-vswitch_git.bb
> b/recipes-support/puppet-vswitch/puppet-vswitch_git.bb
> index b2413283..6b282168 100644
> --- a/recipes-support/puppet-vswitch/puppet-vswitch_git.bb
> +++ b/recipes-support/puppet-vswitch/puppet-vswitch_git.bb
> @@ -16,7 +16,6 @@ inherit rubyv2
>  GEM_NAME =3D "puppetlabs-std"
>  GEM_SPEC_FILE =3D "puppet-vswitch.gemspec"
>
> -S =3D "${WORKDIR}/git"
>
>  DEPENDS +=3D " \
>          ruby \
> diff --git a/recipes-support/puppetlabs-stdlib/puppetlabs-stdlib_git.bb
> b/recipes-support/puppetlabs-stdlib/puppetlabs-stdlib_git.bb
> index 8a3c1def..1132f6be 100644
> --- a/recipes-support/puppetlabs-stdlib/puppetlabs-stdlib_git.bb
> +++ b/recipes-support/puppetlabs-stdlib/puppetlabs-stdlib_git.bb
> @@ -16,7 +16,6 @@ inherit rubyv2
>  GEM_NAME =3D "puppetlabs-std"
>  GEM_SPEC_FILE =3D "puppetlabs-stdlib.gemspec"
>
> -S =3D "${WORKDIR}/git"
>
>  DEPENDS +=3D " \
>          ruby \
> diff --git a/recipes-support/ruby-shadow/ruby-shadow_git.bb
> b/recipes-support/ruby-shadow/ruby-shadow_git.bb
> index 9a82a5bd..c9251aa3 100644
> --- a/recipes-support/ruby-shadow/ruby-shadow_git.bb
> +++ b/recipes-support/ruby-shadow/ruby-shadow_git.bb
> @@ -10,7 +10,6 @@ SRC_URI =3D "git://
> github.com/apalmblad/ruby-shadow.git;branch=3Dmaster;protocol=3Dhtt
>             file://extconf.rb"
>
>  SRCREV =3D "f135b3fd52d0a638f2eb9b17a8952a7f0f317688"
> -S =3D "${WORKDIR}/git"
>
>  inherit ruby
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9309):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9309
> Mute This Topic: https://lists.yoctoproject.org/mt/114180711/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000fb04a4063a0bc245
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 16, 2025 at 2:00=
=E2=80=AFAM Chen Qi via <a href=3D"http://lists.yoctoproject.org">lists.yoc=
toproject.org</a> &lt;Qi.Chen=3D<a href=3D"mailto:windriver.com@lists.yocto=
project.org">windriver.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">From: Chen Qi &lt;<a href=
=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</=
a>&gt;<br>
<br>
Due to recent oe-core&#39;s change about UNPACKDIR/S, these settings<br>
are no longer valid and are causing errors.<br>
<br>
The git fetcher in bitbake now defaults to fetch git source to<br>
be under /${BP} instead of /git. So using &#39;/git&#39; is no longer valid=
.<br>
<br>
In addition, S now locates under ${UNPACKDIR} instead of ${WORKDIR}.<br>
<br>
So the default value of S (S =3D &quot;${UNPACKDIR}/${BP}&quot; from bitbak=
e.conf)<br>
is already enough and do not need any further settings for these git<br>
recipes.<br></blockquote><div><br></div><div><br></div><div><div class=3D"g=
mail_default" style=3D"font-size:small">Ooops. My mistake on this, I was so=
 busy doing the package uprevs in meta-virt,</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">that I forgot to commit and push my changes t=
o m-c-s.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;ll check m=
ine against this and take care of it shortly.</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-connectivity/consul/<a href=3D"http://consul-migrate_git.bb" =
rel=3D"noreferrer" target=3D"_blank">consul-migrate_git.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0recipes-connectivity/consul/<a href=3D"http://consul_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">consul_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0recipes-connectivity/serf/<a href=3D"http://hashicorp-serf_0.9.4.bb" =
rel=3D"noreferrer" target=3D"_blank">hashicorp-serf_0.9.4.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0recipes-devtools/python/python-ansible.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0recipes-support/puppet-vswitch/<a href=3D"http://puppet-vswitch_git.b=
b" rel=3D"noreferrer" target=3D"_blank">puppet-vswitch_git.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0recipes-support/puppetlabs-stdlib/<a href=3D"http://puppetlabs-stdlib=
_git.bb" rel=3D"noreferrer" target=3D"_blank">puppetlabs-stdlib_git.bb</a> =
| 1 -<br>
=C2=A0recipes-support/ruby-shadow/<a href=3D"http://ruby-shadow_git.bb" rel=
=3D"noreferrer" target=3D"_blank">ruby-shadow_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A07 files changed, 7 deletions(-)<br>
<br>
diff --git a/recipes-connectivity/consul/<a href=3D"http://consul-migrate_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">consul-migrate_git.bb</a> b/rec=
ipes-connectivity/consul/<a href=3D"http://consul-migrate_git.bb" rel=3D"no=
referrer" target=3D"_blank">consul-migrate_git.bb</a><br>
index 1393c912..3c9518ee 100644<br>
--- a/recipes-connectivity/consul/<a href=3D"http://consul-migrate_git.bb" =
rel=3D"noreferrer" target=3D"_blank">consul-migrate_git.bb</a><br>
+++ b/recipes-connectivity/consul/<a href=3D"http://consul-migrate_git.bb" =
rel=3D"noreferrer" target=3D"_blank">consul-migrate_git.bb</a><br>
@@ -7,7 +7,6 @@ GO_IMPORT =3D &quot;<a href=3D"http://github.com/hashicorp/=
consul-migrate" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/c=
onsul-migrate</a>&quot;<br>
=C2=A0SRC_URI =3D &quot;https://${GO_IMPORT}.git;branch=3Dmaster&quot;<br>
=C2=A0SRCREV =3D &quot;678fb10cdeae25ab309e99e655148f0bf65f9710&quot;<br>
<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0SRCREV_raft =3D &quot;057b893fd996696719e98b6c44649ea14968c811&quot;<=
br>
=C2=A0SRCREV_go-metrics =3D &quot;f303b03b91d770a11a39677f1d3b55da4002bbcb&=
quot;<br>
diff --git a/recipes-connectivity/consul/<a href=3D"http://consul_git.bb" r=
el=3D"noreferrer" target=3D"_blank">consul_git.bb</a> b/recipes-connectivit=
y/consul/<a href=3D"http://consul_git.bb" rel=3D"noreferrer" target=3D"_bla=
nk">consul_git.bb</a><br>
index 0d084b0d..3dceb9d8 100644<br>
--- a/recipes-connectivity/consul/<a href=3D"http://consul_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">consul_git.bb</a><br>
+++ b/recipes-connectivity/consul/<a href=3D"http://consul_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">consul_git.bb</a><br>
@@ -10,7 +10,6 @@ SRC_URI =3D &quot;git://${GO_IMPORT}.git;branch=3Dmain;pr=
otocol=3Dhttps \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://consul.service \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0RDEPENDS:${PN}-dev:append =3D &quot; bash&quot;<br>
<br>
diff --git a/recipes-connectivity/serf/<a href=3D"http://hashicorp-serf_0.9=
.4.bb" rel=3D"noreferrer" target=3D"_blank">hashicorp-serf_0.9.4.bb</a> b/r=
ecipes-connectivity/serf/<a href=3D"http://hashicorp-serf_0.9.4.bb" rel=3D"=
noreferrer" target=3D"_blank">hashicorp-serf_0.9.4.bb</a><br>
index 8318400d..e46acbdc 100644<br>
--- a/recipes-connectivity/serf/<a href=3D"http://hashicorp-serf_0.9.4.bb" =
rel=3D"noreferrer" target=3D"_blank">hashicorp-serf_0.9.4.bb</a><br>
+++ b/recipes-connectivity/serf/<a href=3D"http://hashicorp-serf_0.9.4.bb" =
rel=3D"noreferrer" target=3D"_blank">hashicorp-serf_0.9.4.bb</a><br>
@@ -22,7 +22,6 @@ SRC_URI =3D &quot;git://${GO_IMPORT}.git;protocol=3Dhttps=
;branch=3Dmaster&quot;<br>
=C2=A0PV =3D &quot;0.8.5+git${SRCPV}&quot;<br>
=C2=A0SRCREV =3D &quot;1d3fdf93bbe5002c5023da50402368a817488691&quot;<br>
<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0inherit go<br>
<br>
diff --git a/recipes-devtools/python/python-ansible.inc b/recipes-devtools/=
python/python-ansible.inc<br>
index 4bb90cb7..737daa9a 100644<br>
--- a/recipes-devtools/python/python-ansible.inc<br>
+++ b/recipes-devtools/python/python-ansible.inc<br>
@@ -10,7 +10,6 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/ansi=
ble/ansible.git;protocol=3Dhttps;branch=3Dstable-2.1" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/ansible/ansible.git;protocol=3Dhttps;branch=3Dst=
able-2.1</a><br>
<br>
=C2=A0SRCREV =3D &quot;dc0e3bd16cc7ded081bc46c88e4e3d1997ca9bb0&quot;<br>
<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0ANSIBLE_WHITELIST_MODULES ?=3D &quot;commands files system network/ov=
s __pycache__ service&quot;<br>
<br>
diff --git a/recipes-support/puppet-vswitch/<a href=3D"http://puppet-vswitc=
h_git.bb" rel=3D"noreferrer" target=3D"_blank">puppet-vswitch_git.bb</a> b/=
recipes-support/puppet-vswitch/<a href=3D"http://puppet-vswitch_git.bb" rel=
=3D"noreferrer" target=3D"_blank">puppet-vswitch_git.bb</a><br>
index b2413283..6b282168 100644<br>
--- a/recipes-support/puppet-vswitch/<a href=3D"http://puppet-vswitch_git.b=
b" rel=3D"noreferrer" target=3D"_blank">puppet-vswitch_git.bb</a><br>
+++ b/recipes-support/puppet-vswitch/<a href=3D"http://puppet-vswitch_git.b=
b" rel=3D"noreferrer" target=3D"_blank">puppet-vswitch_git.bb</a><br>
@@ -16,7 +16,6 @@ inherit rubyv2<br>
=C2=A0GEM_NAME =3D &quot;puppetlabs-std&quot;<br>
=C2=A0GEM_SPEC_FILE =3D &quot;puppet-vswitch.gemspec&quot;<br>
<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ruby \<br>
diff --git a/recipes-support/puppetlabs-stdlib/<a href=3D"http://puppetlabs=
-stdlib_git.bb" rel=3D"noreferrer" target=3D"_blank">puppetlabs-stdlib_git.=
bb</a> b/recipes-support/puppetlabs-stdlib/<a href=3D"http://puppetlabs-std=
lib_git.bb" rel=3D"noreferrer" target=3D"_blank">puppetlabs-stdlib_git.bb</=
a><br>
index 8a3c1def..1132f6be 100644<br>
--- a/recipes-support/puppetlabs-stdlib/<a href=3D"http://puppetlabs-stdlib=
_git.bb" rel=3D"noreferrer" target=3D"_blank">puppetlabs-stdlib_git.bb</a><=
br>
+++ b/recipes-support/puppetlabs-stdlib/<a href=3D"http://puppetlabs-stdlib=
_git.bb" rel=3D"noreferrer" target=3D"_blank">puppetlabs-stdlib_git.bb</a><=
br>
@@ -16,7 +16,6 @@ inherit rubyv2<br>
=C2=A0GEM_NAME =3D &quot;puppetlabs-std&quot;<br>
=C2=A0GEM_SPEC_FILE =3D &quot;puppetlabs-stdlib.gemspec&quot;<br>
<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ruby \<br>
diff --git a/recipes-support/ruby-shadow/<a href=3D"http://ruby-shadow_git.=
bb" rel=3D"noreferrer" target=3D"_blank">ruby-shadow_git.bb</a> b/recipes-s=
upport/ruby-shadow/<a href=3D"http://ruby-shadow_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">ruby-shadow_git.bb</a><br>
index 9a82a5bd..c9251aa3 100644<br>
--- a/recipes-support/ruby-shadow/<a href=3D"http://ruby-shadow_git.bb" rel=
=3D"noreferrer" target=3D"_blank">ruby-shadow_git.bb</a><br>
+++ b/recipes-support/ruby-shadow/<a href=3D"http://ruby-shadow_git.bb" rel=
=3D"noreferrer" target=3D"_blank">ruby-shadow_git.bb</a><br>
@@ -10,7 +10,6 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/apal=
mblad/ruby-shadow.git;branch=3Dmaster;protocol=3Dhtt" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/apalmblad/ruby-shadow.git;branch=3Dmaster;protoc=
ol=3Dhtt</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://extconf.rb&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;f135b3fd52d0a638f2eb9b17a8952a7f0f317688&quot;<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0inherit ruby<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9309): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9309" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9309</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/114180711/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/114180711/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000fb04a4063a0bc245--

