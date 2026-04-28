Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5E1FF885A
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 21:41:42 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.581.1777412497640844873
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 14:41:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CV7L21QX;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: ticotimo@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38e96a071c3so121627341fa.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 14:41:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777412496; cv=none;
        d=google.com; s=arc-20240605;
        b=bY7+r4nK3ZH/PK4yA1lAMm3SCX25bUToLCqTpZWye31rDvI5UdU8ZsT+77IKUkEcH3
         xQqmYv1TeDkVoz28QFQWwPDE8civhCGVZ/c9Xzt3duf6oPM7W5o0bntGveQKbnpFvtDn
         C4B6+95IHCESUCejpOByqeJo+59tb6CZJB2G8iu0F2tiW9pnzQz60IL7nPCYFRuFP96F
         XmtK1hCStuVRe4wDd//1Ng5P9146zOC1FyLmuDtyshQd1ztUfdgglcW3WBfArs/K6oxW
         2ind3jhlxnbiQ42LOKa6Z4VvWCtNapEqQS2+U2u2F7VInxecTTlMNx82NL5DqKMlpda8
         jn1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VBDrDfa9v00fUVZAPnoslT1SZygqeXMa4pGYI29dfok=;
        fh=eCwnOjlv6B8KHYbz1+dR8q8uprCZzyTQ1RaTi1tuuHw=;
        b=OIR0cWIWnrUCtXaMYJACH53rxzuORoDwyWhVhNkfTOqo928CyMJcTujvvNslhtdetW
         o0fqWFGVXaf5J/CweEyEiOaRteWzkFwLy/9em4bFbZa4kZ9cJ1s2KeoqCZwjVgvlSQFx
         bkhZHCZX5T6bsBmQ2qiJaMNBWctkiCsooSrfjHi4ybnw5Jlgn4t0VrNYjq3U1IBLpMVP
         7DUsAZQC4OBWxdXaFDI0SC5L4WzjqFLy1zQcc1Z/5e8blLE/M30kzXWGAC9jLQj7tD8h
         D6otf7zCC+nav/hUn0ZzEJ+SLAU3Uv0fz62Yy8wI9EbvK3aGUZsxrI7bV+ep16kVP2cz
         y7BA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777412496; x=1778017296; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VBDrDfa9v00fUVZAPnoslT1SZygqeXMa4pGYI29dfok=;
        b=CV7L21QXYXjAy5fgK2yl/hcEPOTJzgrWCbYeCIClfuxVWkHKxFzV5nJe1G2X3aLSVo
         NroNsnEQuDUdyadL+lIxk42PXDeKJdo5JFdjxpTsfI2sBx1kuS8ZnvHdWQJPnMDpgXlJ
         21fluwPK4reqMnW3NSfpZrtm+xsvjFuxKE49lUyLSrshYXePC2oiTcOV1hRiTMY5RPwY
         mTqZxWtmbLP06bbi9SkWdxJhq9e+fqC+E4UITvkhT4TKVgxHcTHv2ChL7l/mwvpIqWiR
         Cvd+z9gpjipFe51bEUVAD5dr8glO6RePaS0WAmDQlHxEleCwHx9nkRKOQ2YNd6Qzgizj
         SkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777412496; x=1778017296;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBDrDfa9v00fUVZAPnoslT1SZygqeXMa4pGYI29dfok=;
        b=NWyxPs1qKjVByDhMLoE21SFpPVERbCVDMsb45IUdqqXt1O+iaK62LI1arEGqIMJYdH
         DsMWkhS1qOwOIiOyHjYzPl0VFGgMgWysvXr3drWCL8FToAbEs3xiYs5cIFrhE6gF28NV
         kW0FXpCE7nGpcpu4CIGy+7thILQ7IkzL0FEUkWnmh+PSlKSgdlCnNHRmo8nVz3PRdccU
         Xj0kuw9OyAKiKgNApM1OWrfPVAnFdmhDZKTFtzFKcQJbKD+YDvgdmsJTmYAe0fYldsJU
         UUYI0EdoXEAQ7qfflmHQk0cWeyCuR6HSjER41oFK4PGDEfbR34Gfdtq8z4I5j9KKHSR8
         t2rA==
X-Gm-Message-State: AOJu0YxDgSXjU7iIr15Z0EkF/KacgbSSdQanPPe5m2ikRTdNYLoGSHqL
	6fTyEaP6Gk4gfQkONBGt3776jXHIAnd5GWVgfHJoXSmk/qzVQ/TG2I22x1/Hpbol82AhEh+Y6ux
	AOpyKaElpuzFp4f47MemT0qjMew+vdMY=
X-Gm-Gg: AeBDieu3L6SLgUtCXDZIZDf4JyhI/BtOfadVNgYjAZQQoFJnrHm1dy+Oo78T4+X16j/
	8eGF5iM7jdRzZ2nsua3RjGC3MVKbPYxN/widJL9/UEE/s959PbSYAZ1JCvP9D40b35ZoaLqRRud
	iIlsDfmoYr9P7GqCoeR9Xb3+ozv83O7wIcLWlzWf0zDtaUjcgfSKvIFyn2bK+oJiCDleb3Dq1tK
	5pU8o/2sXWWX1Kg5Lla/S+DwV6vLDdEIV8VPdhRYvkbHWF+fhiviUOM8Vio+6bu/f91JT9zG/Lt
	hp90mBSDOZyYwgEAAQ==
X-Received: by 2002:a05:651c:1506:b0:38e:d834:5ce2 with SMTP id
 38308e7fff4ca-39240cacabdmr18125681fa.1.1777412495400; Tue, 28 Apr 2026
 14:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1777337030.git.tim.orling@konsulko.com> <26a08ff9d76bb10e58a61d5ab0d136fa2023a3fb.1777337030.git.tim.orling@konsulko.com>
 <CADkTA4P0nUrk8-sOBeubiOwEC0BJJQqpbAm8dSbg79CjtwEt_g@mail.gmail.com>
In-Reply-To: <CADkTA4P0nUrk8-sOBeubiOwEC0BJJQqpbAm8dSbg79CjtwEt_g@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 28 Apr 2026 14:41:23 -0700
X-Gm-Features: AVHnY4LLZ6k27MUJcP6F9uBVdB6Irr4UIHQwawCvloNX-VuX2dtg8Bsy5nMw5qU
Message-ID: <CANx9H-DwH_ti+8M95zX8PUVOcMLmStz0zJCXJFeK8a4X7411XA@mail.gmail.com>
Subject: Re: [meta-virtualization] [RFC PATCH 4/4] vcontainer-tarball: fix SDK
 environment script for CI
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000068610a06508c18bb"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 21:41:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9777

--00000000000068610a06508c18bb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 4:56=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gmai=
l.com>
wrote:

>
>
> On Mon, Apr 27, 2026 at 9:13=E2=80=AFPM Tim Orling via lists.yoctoproject=
.org
> <ticotimo=3Dgmail.com@lists.yoctoproject.org> wrote:
>
>> When running in an AutoBuilder context, the variables are stripped
>> since the script is not actually "sourced", but rather parsed.
>>
>> This resulted in VCONTAINER_DIR being empty and therefore no
>> 'vdkr', 'vpdmn' and friends available to run in CI builder steps.
>>
>
>  Tim,
>
> I agree the autobuilder's Python parser can't handle our bash-oriented
> environment script, but I'd rather not add this much complexity to make
> one script serve both environments.
>
> The inline if [ -n "${BASH_SOURCE[0]:-}" ] guards and dual-path logic
> make the script harder to reason about  and maintain.
>

Agreed. That was an ugly hack and I did not like it either.


>
> Instead, I think we should generate two scripts:
>
>   1. environment-setup-* (existing) =E2=80=94 stays as-is, pure bash, BAS=
H_SOURCE
> based, for interactive/devshell use
>   2. environment-setup-ci =E2=80=94 flat export FOO=3D"/absolute/path" li=
nes with
> baked-in paths, no shell variable references, no unset, specifically for
> the autobuilder's enable_tools_tarball() parser
>
>
The current enable_tools_tarball uses a "greedy" glob of
"environment-setup-*" [1], which could be modified to be passed in
as a keyword arg -- with a default.

[1]
https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/utils.py=
?id=3D7ba82651cae130890e2120dccca939153ec7042e#n445

The CI script would be simple:
>
>   export VCONTAINER_DIR=3D"/opt/poky/sysroots/x86_64-pokysdk-linux"
>   export OECORE_NATIVE_SYSROOT=3D"/opt/poky/sysroots/x86_64-pokysdk-linux=
"
>   export
> PATH=3D"/opt/poky/sysroots/x86_64-pokysdk-linux:/opt/poky/sysroots/x86_64=
-pokysdk-linux/usr/bin:/usr/bin:/bin"
>
>
Currently, since the vcontainer-tarball is not yet published to
downloads.yoctoproject.org, the CI path is passed in as:
VCONTAINER_SDK=3D/srv/autobuilder/
autobuilder.yocto.io/pub/vcontainer-tarball-latest/vcontainer-standalone.sh

When 'vcontainer' is enabled as a worker feature, a pre-build step is added
which currently installs the SDK to:
/home/pokybuild/yocto-worker/vcontainer-tests/build/build/vcontainer-test-e=
xtracted

Where "vcontainer-tests" is a "builder" (job) which needs the SDK
installed. This was also partially done this way so
that I can test a "just built" vcontainer-tarball with test jobs like
vcontainer-tests, vdkr-tests and vpdmn-tests (before
even trying to build and push containers).



> SDK relocation rewrites the absolute paths at install time. The autobuild=
er
> helper would reference this file instead of the bash one. No conditional
> logic, no dual-purpose complexity.
>

I agree we should avoid that brittle path of conditional logic and
dual-purpose complexity.


>
> Would this work with the autobuilder helper's enable_tools_tarball()?
>

I think it will work. Given the reality of how these things interact in the
Yocto AutoBuilder context, I will play
around with it. I already know what works and doesn't and how to test it ;)

Thank you for the feedback!

--Tim


>
> If so I can implement it.
>
> Bruce
>
>
>
>>
>> AI-Generated: Claude Cowork Opus 4.7
>> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
>> ---
>>  .../vcontainer/vcontainer-tarball.bb          | 69 +++++++++++++++----
>>  1 file changed, 57 insertions(+), 12 deletions(-)
>>
>> diff --git a/recipes-containers/vcontainer/vcontainer-tarball.bb
>> b/recipes-containers/vcontainer/vcontainer-tarball.bb
>> index ed9b8e13..9564164c 100644
>> --- a/recipes-containers/vcontainer/vcontainer-tarball.bb
>> +++ b/recipes-containers/vcontainer/vcontainer-tarball.bb
>> @@ -353,20 +353,57 @@ EOF
>>
>>  script=3D${SDK_OUTPUT}/${SDKPATH}/environment-setup-${REAL_MULTIMACH_TA=
RGET_SYS}
>>
>>      # Create environment script
>> -    # Set OECORE_NATIVE_SYSROOT temporarily for SDK relocation, then
>> unset it
>> -    # (like buildtools-tarball does to avoid confusing other Yocto tool=
s)
>> +    #
>> +    # The script is written so that it works both when sourced by bash
>> (the
>> +    # normal interactive / devshell case) AND when "installed" by
>> +    # yocto-autobuilder-helper's enable_tools_tarball() in CI, which
>> does NOT
>> +    # source the file with bash -- it parses line by line in Python and
>> only
>> +    # honours lines that start with "export " or "unset " at column 0,
>> and
>> +    # only substitutes $PATH (see
>> yocto-autobuilder-helper/scripts/utils.py).
>> +    #
>> +    # Consequences:
>> +    #  - The primary VCONTAINER_DIR / OECORE_NATIVE_SYSROOT / PATH
>> values must
>> +    #    be emitted as plain `export FOO=3D"<absolute-path>"` lines wit=
h
>> the
>> +    #    absolute paths baked in at build time via Yocto variables
>> +    #    (${SDKPATH}, ${SDKPATHNATIVE}). Yocto SDK relocation rewrites
>> these
>> +    #    paths at install time (via the installer's -d <dir> argument).
>> +    #  - PATH must not reference $VCONTAINER_DIR /
>> $OECORE_NATIVE_SYSROOT via
>> +    #    shell indirection (the Python parser won't expand them); inlin=
e
>> the
>> +    #    absolute paths there too.
>> +    #  - Any bash-only refinement (BASH_SOURCE-based relocation, final
>> +    #    unset of OECORE_NATIVE_SYSROOT) lives inside an `if` block so
>> the
>> +    #    Python parser ignores it, while real bash still executes it.
>>      cat > $script <<'HEADER'
>>  #!/bin/bash
>>  # vcontainer environment setup script
>>  # Source this file: source environment-setup-none
>>  # Or use the symlink: source init-env.sh
>> -
>> -VCONTAINER_DIR=3D"$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
>>  HEADER
>> -    # Yocto variables (${SDK_SYS}, ${SDKPATHNATIVE}) expand at parse ti=
me
>> -    # Shell variables use $VAR to avoid Yocto expansion
>> +    # Primary env vars: emit as plain `export FOO=3D"<abs-path>"` so th=
e
>> +    # yocto-autobuilder-helper Python parser picks them up. Yocto
>> variables
>> +    # expand at bitbake time; the SDK installer's relocation pass
>> rewrites
>> +    # the baked-in paths at install time.
>> +    echo '' >> $script
>> +    echo '# Primary values -- literal absolute paths that survive
>> parsing by' >> $script
>> +    echo '# yocto-autobuilder-helper enable_tools_tarball() (not source=
d
>> by bash).' >> $script
>> +    echo '# SDK relocation at install time rewrites the absolute paths
>> below.' >> $script
>> +    echo 'export VCONTAINER_DIR=3D"'"${SDKPATH}"'"' >> $script
>>      echo 'export OECORE_NATIVE_SYSROOT=3D"'"${SDKPATHNATIVE}"'"' >> $sc=
ript
>> -    echo 'export
>> PATH=3D"$VCONTAINER_DIR:$OECORE_NATIVE_SYSROOT/usr/bin:/usr/bin:/bin:$PA=
TH"'
>> >> $script
>> +    echo 'export
>> PATH=3D"'"${SDKPATH}"':'"${SDKPATHNATIVE}"'/usr/bin:/usr/bin:/bin:$PATH"=
' >>
>> $script
>> +
>> +    # Bash-only refinement: if the file is actually being sourced by
>> bash,
>> +    # re-derive VCONTAINER_DIR from the real on-disk location so a
>> manually
>> +    # moved/copied tarball still works. Invisible to the autobuilder
>> Python
>> +    # parser (doesn't start with export/unset at column 0).
>> +    cat >> $script <<'BASHREFINE'
>> +
>> +# When sourced by bash (interactive / devshell), prefer the real on-dis=
k
>> +# location so a manually-moved tarball still works.
>> +if [ -n "${BASH_SOURCE[0]:-}" ]; then
>> +    VCONTAINER_DIR=3D"$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
>> +    export VCONTAINER_DIR
>> +fi
>> +BASHREFINE
>>      cat >> $script <<'FOOTER'
>>
>>  echo "vcontainer environment configured."
>> @@ -395,11 +432,19 @@ echo ""
>>  echo "Architectures: ${VCONTAINER_ARCHITECTURES}"
>>  ENVEOF
>>
>> -    # Unset OECORE_NATIVE_SYSROOT to avoid confusing other Yocto tools
>> -    # (same pattern as buildtools-tarball)
>> -    echo '' >> $script
>> -    echo '# Clean up - unset to avoid confusing other Yocto tools' >>
>> $script
>> -    echo 'unset OECORE_NATIVE_SYSROOT' >> $script
>> +    # Gated unset: same pattern as buildtools-tarball (unset
>> +    # OECORE_NATIVE_SYSROOT after interactive sourcing so it doesn't
>> confuse
>> +    # other Yocto tools), but guarded behind an `if` so the autobuilder=
's
>> +    # line-based parser (which matches "unset " only at column 0) leave=
s
>> +    # OECORE_NATIVE_SYSROOT set in the CI environment.
>> +    cat >> $script <<'UNSET_BLOCK'
>> +
>> +# Avoid confusing other Yocto tools post-source (matches
>> buildtools-tarball).
>> +# Gated so yocto-autobuilder-helper's parser leaves
>> OECORE_NATIVE_SYSROOT set.
>> +if [ -n "${BASH_SOURCE[0]:-}" ]; then
>> +    unset OECORE_NATIVE_SYSROOT
>> +fi
>> +UNSET_BLOCK
>>
>>      # Replace placeholder with actual SDK_SYS
>>      sed -i -e "s:@SDK_SYS@:${SDK_SYS}:g" $script
>> --
>> 2.50.1 (Apple Git-155)
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#9753):
>> https://lists.yoctoproject.org/g/meta-virtualization/message/9753
>> Mute This Topic: https://lists.yoctoproject.org/mt/119042096/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub =
[
>> bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>

--00000000000068610a06508c18bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 28,=
 2026 at 4:56=E2=80=AFAM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfiel=
d@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div=
 dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-size:small"><br></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On M=
on, Apr 27, 2026 at 9:13=E2=80=AFPM Tim Orling via <a href=3D"http://lists.=
yoctoproject.org" target=3D"_blank">lists.yoctoproject.org</a> &lt;ticotimo=
=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org" target=3D"_blank">gm=
ail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">When running in an AutoBuilder context, the v=
ariables are stripped<br>
since the script is not actually &quot;sourced&quot;, but rather parsed.<br=
>
<br>
This resulted in VCONTAINER_DIR being empty and therefore no<br>
&#39;vdkr&#39;, &#39;vpdmn&#39; and friends available to run in CI builder =
steps.<br></blockquote><div><br></div><div><div style=3D"font-size:small">=
=C2=A0Tim,<br><br>I agree the autobuilder&#39;s Python parser can&#39;t han=
dle our bash-oriented</div><div style=3D"font-size:small">environment scrip=
t, but I&#39;d rather not add this much complexity to make</div><div style=
=3D"font-size:small">one script serve both environments.=C2=A0</div><div st=
yle=3D"font-size:small"><br></div><div style=3D"font-size:small">The inline=
 if [ -n &quot;${BASH_SOURCE[0]:-}&quot; ] guards and dual-path logic</div>=
<div style=3D"font-size:small">make the script harder to reason about=C2=A0=
 and maintain.<br></div></div></div></div></div></div></blockquote><div><br=
>Agreed. That was an ugly hack and I did not like it either.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><div sty=
le=3D"font-size:small"><br>Instead, I think we should generate two scripts:=
<br><br>=C2=A0 1. environment-setup-* (existing) =E2=80=94 stays as-is, pur=
e bash, BASH_SOURCE based, for interactive/devshell use<br>=C2=A0 2. enviro=
nment-setup-ci =E2=80=94 flat export FOO=3D&quot;/absolute/path&quot; lines=
 with baked-in paths, no shell variable references, no unset, specifically =
for the autobuilder&#39;s enable_tools_tarball() parser<br><br></div></div>=
</div></div></div></div></blockquote><div><br>The current=C2=A0enable_tools=
_tarball uses a &quot;greedy&quot; glob of &quot;environment-setup-*&quot; =
[1], which could be modified to be passed in</div><div>as a keyword arg -- =
with a default.<br><br>[1]=C2=A0<a href=3D"https://git.yoctoproject.org/yoc=
to-autobuilder-helper/tree/scripts/utils.py?id=3D7ba82651cae130890e2120dccc=
a939153ec7042e#n445">https://git.yoctoproject.org/yocto-autobuilder-helper/=
tree/scripts/utils.py?id=3D7ba82651cae130890e2120dccca939153ec7042e#n445</a=
></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_quote">=
<div><div style=3D"font-size:small">The CI script would be simple:<br><br>=
=C2=A0 export VCONTAINER_DIR=3D&quot;/opt/poky/sysroots/x86_64-pokysdk-linu=
x&quot;<br>=C2=A0 export OECORE_NATIVE_SYSROOT=3D&quot;/opt/poky/sysroots/x=
86_64-pokysdk-linux&quot;<br>=C2=A0 export PATH=3D&quot;/opt/poky/sysroots/=
x86_64-pokysdk-linux:/opt/poky/sysroots/x86_64-pokysdk-linux/usr/bin:/usr/b=
in:/bin&quot;<br><br></div></div></div></div></div></div></blockquote><div>=
<br></div><div>Currently, since the vcontainer-tarball=C2=A0is not yet publ=
ished to <a href=3D"http://downloads.yoctoproject.org">downloads.yoctoproje=
ct.org</a>, the CI path is passed in as:<br>VCONTAINER_SDK=3D/srv/autobuild=
er/<a href=3D"http://autobuilder.yocto.io/pub/vcontainer-tarball-latest/vco=
ntainer-standalone.sh">autobuilder.yocto.io/pub/vcontainer-tarball-latest/v=
container-standalone.sh</a></div><div><br></div><div>When &#39;vcontainer&#=
39; is enabled as a worker feature, a pre-build step is added which current=
ly installs the SDK to:</div><div>/home/pokybuild/yocto-worker/vcontainer-t=
ests/build/build/vcontainer-test-extracted<br><br>Where &quot;vcontainer-te=
sts&quot; is a &quot;builder&quot; (job) which needs the SDK installed. Thi=
s was also partially done this way so</div><div>that I can test a &quot;jus=
t built&quot; vcontainer-tarball with test jobs like vcontainer-tests, vdkr=
-tests and vpdmn-tests (before</div><div>even trying to build and push cont=
ainers).<br><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><div><div style=3D"font-size:small">SDK relocation rewrite=
s the absolute paths at install time. The autobuilder</div><div style=3D"fo=
nt-size:small">helper would reference this file instead of the bash one. No=
 conditional logic, no dual-purpose complexity.<br></div></div></div></div>=
</div></div></blockquote><div><br></div><div>I agree we should avoid that b=
rittle path of conditional logic and dual-purpose complexity.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><div sty=
le=3D"font-size:small"><br>Would this work with the autobuilder helper&#39;=
s enable_tools_tarball()?=C2=A0</div></div></div></div></div></div></blockq=
uote><div><br>I think it will work. Given the reality of how these things i=
nteract in the Yocto AutoBuilder context, I will play</div><div>around with=
 it. I already know what works and doesn&#39;t and how to test it ;)</div><=
div><br></div><div>Thank you for the feedback!</div><div><br></div><div>--T=
im</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_quot=
e"><div><div style=3D"font-size:small"><br></div><div style=3D"font-size:sm=
all">If so I can implement it.<br><br>Bruce<br></div><div style=3D"font-siz=
e:small"><br></div><div style=3D"font-size:small">=C2=A0</div></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
AI-Generated: Claude Cowork Opus 4.7<br>
Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" ta=
rget=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
---<br>
=C2=A0.../vcontainer/<a href=3D"http://vcontainer-tarball.bb" rel=3D"norefe=
rrer" target=3D"_blank">vcontainer-tarball.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 69 +++++++++++++++----<br>
=C2=A01 file changed, 57 insertions(+), 12 deletions(-)<br>
<br>
diff --git a/recipes-containers/vcontainer/<a href=3D"http://vcontainer-tar=
ball.bb" rel=3D"noreferrer" target=3D"_blank">vcontainer-tarball.bb</a> b/r=
ecipes-containers/vcontainer/<a href=3D"http://vcontainer-tarball.bb" rel=
=3D"noreferrer" target=3D"_blank">vcontainer-tarball.bb</a><br>
index ed9b8e13..9564164c 100644<br>
--- a/recipes-containers/vcontainer/<a href=3D"http://vcontainer-tarball.bb=
" rel=3D"noreferrer" target=3D"_blank">vcontainer-tarball.bb</a><br>
+++ b/recipes-containers/vcontainer/<a href=3D"http://vcontainer-tarball.bb=
" rel=3D"noreferrer" target=3D"_blank">vcontainer-tarball.bb</a><br>
@@ -353,20 +353,57 @@ EOF<br>
=C2=A0 =C2=A0 =C2=A0script=3D${SDK_OUTPUT}/${SDKPATH}/environment-setup-${R=
EAL_MULTIMACH_TARGET_SYS}<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Create environment script<br>
-=C2=A0 =C2=A0 # Set OECORE_NATIVE_SYSROOT temporarily for SDK relocation, =
then unset it<br>
-=C2=A0 =C2=A0 # (like buildtools-tarball does to avoid confusing other Yoc=
to tools)<br>
+=C2=A0 =C2=A0 #<br>
+=C2=A0 =C2=A0 # The script is written so that it works both when sourced b=
y bash (the<br>
+=C2=A0 =C2=A0 # normal interactive / devshell case) AND when &quot;install=
ed&quot; by<br>
+=C2=A0 =C2=A0 # yocto-autobuilder-helper&#39;s enable_tools_tarball() in C=
I, which does NOT<br>
+=C2=A0 =C2=A0 # source the file with bash -- it parses line by line in Pyt=
hon and only<br>
+=C2=A0 =C2=A0 # honours lines that start with &quot;export &quot; or &quot=
;unset &quot; at column 0, and<br>
+=C2=A0 =C2=A0 # only substitutes $PATH (see yocto-autobuilder-helper/scrip=
ts/utils.py).<br>
+=C2=A0 =C2=A0 #<br>
+=C2=A0 =C2=A0 # Consequences:<br>
+=C2=A0 =C2=A0 #=C2=A0 - The primary VCONTAINER_DIR / OECORE_NATIVE_SYSROOT=
 / PATH values must<br>
+=C2=A0 =C2=A0 #=C2=A0 =C2=A0 be emitted as plain `export FOO=3D&quot;&lt;a=
bsolute-path&gt;&quot;` lines with the<br>
+=C2=A0 =C2=A0 #=C2=A0 =C2=A0 absolute paths baked in at build time via Yoc=
to variables<br>
+=C2=A0 =C2=A0 #=C2=A0 =C2=A0 (${SDKPATH}, ${SDKPATHNATIVE}). Yocto SDK rel=
ocation rewrites these<br>
+=C2=A0 =C2=A0 #=C2=A0 =C2=A0 paths at install time (via the installer&#39;=
s -d &lt;dir&gt; argument).<br>
+=C2=A0 =C2=A0 #=C2=A0 - PATH must not reference $VCONTAINER_DIR / $OECORE_=
NATIVE_SYSROOT via<br>
+=C2=A0 =C2=A0 #=C2=A0 =C2=A0 shell indirection (the Python parser won&#39;=
t expand them); inline the<br>
+=C2=A0 =C2=A0 #=C2=A0 =C2=A0 absolute paths there too.<br>
+=C2=A0 =C2=A0 #=C2=A0 - Any bash-only refinement (BASH_SOURCE-based reloca=
tion, final<br>
+=C2=A0 =C2=A0 #=C2=A0 =C2=A0 unset of OECORE_NATIVE_SYSROOT) lives inside =
an `if` block so the<br>
+=C2=A0 =C2=A0 #=C2=A0 =C2=A0 Python parser ignores it, while real bash sti=
ll executes it.<br>
=C2=A0 =C2=A0 =C2=A0cat &gt; $script &lt;&lt;&#39;HEADER&#39;<br>
=C2=A0#!/bin/bash<br>
=C2=A0# vcontainer environment setup script<br>
=C2=A0# Source this file: source environment-setup-none<br>
=C2=A0# Or use the symlink: source init-env.sh<br>
-<br>
-VCONTAINER_DIR=3D&quot;$(cd &quot;$(dirname &quot;${BASH_SOURCE[0]}&quot;)=
&quot; &amp;&amp; pwd)&quot;<br>
=C2=A0HEADER<br>
-=C2=A0 =C2=A0 # Yocto variables (${SDK_SYS}, ${SDKPATHNATIVE}) expand at p=
arse time<br>
-=C2=A0 =C2=A0 # Shell variables use $VAR to avoid Yocto expansion<br>
+=C2=A0 =C2=A0 # Primary env vars: emit as plain `export FOO=3D&quot;&lt;ab=
s-path&gt;&quot;` so the<br>
+=C2=A0 =C2=A0 # yocto-autobuilder-helper Python parser picks them up. Yoct=
o variables<br>
+=C2=A0 =C2=A0 # expand at bitbake time; the SDK installer&#39;s relocation=
 pass rewrites<br>
+=C2=A0 =C2=A0 # the baked-in paths at install time.<br>
+=C2=A0 =C2=A0 echo &#39;&#39; &gt;&gt; $script<br>
+=C2=A0 =C2=A0 echo &#39;# Primary values -- literal absolute paths that su=
rvive parsing by&#39; &gt;&gt; $script<br>
+=C2=A0 =C2=A0 echo &#39;# yocto-autobuilder-helper enable_tools_tarball() =
(not sourced by bash).&#39; &gt;&gt; $script<br>
+=C2=A0 =C2=A0 echo &#39;# SDK relocation at install time rewrites the abso=
lute paths below.&#39; &gt;&gt; $script<br>
+=C2=A0 =C2=A0 echo &#39;export VCONTAINER_DIR=3D&quot;&#39;&quot;${SDKPATH=
}&quot;&#39;&quot;&#39; &gt;&gt; $script<br>
=C2=A0 =C2=A0 =C2=A0echo &#39;export OECORE_NATIVE_SYSROOT=3D&quot;&#39;&qu=
ot;${SDKPATHNATIVE}&quot;&#39;&quot;&#39; &gt;&gt; $script<br>
-=C2=A0 =C2=A0 echo &#39;export PATH=3D&quot;$VCONTAINER_DIR:$OECORE_NATIVE=
_SYSROOT/usr/bin:/usr/bin:/bin:$PATH&quot;&#39; &gt;&gt; $script<br>
+=C2=A0 =C2=A0 echo &#39;export PATH=3D&quot;&#39;&quot;${SDKPATH}&quot;&#3=
9;:&#39;&quot;${SDKPATHNATIVE}&quot;&#39;/usr/bin:/usr/bin:/bin:$PATH&quot;=
&#39; &gt;&gt; $script<br>
+<br>
+=C2=A0 =C2=A0 # Bash-only refinement: if the file is actually being source=
d by bash,<br>
+=C2=A0 =C2=A0 # re-derive VCONTAINER_DIR from the real on-disk location so=
 a manually<br>
+=C2=A0 =C2=A0 # moved/copied tarball still works. Invisible to the autobui=
lder Python<br>
+=C2=A0 =C2=A0 # parser (doesn&#39;t start with export/unset at column 0).<=
br>
+=C2=A0 =C2=A0 cat &gt;&gt; $script &lt;&lt;&#39;BASHREFINE&#39;<br>
+<br>
+# When sourced by bash (interactive / devshell), prefer the real on-disk<b=
r>
+# location so a manually-moved tarball still works.<br>
+if [ -n &quot;${BASH_SOURCE[0]:-}&quot; ]; then<br>
+=C2=A0 =C2=A0 VCONTAINER_DIR=3D&quot;$(cd &quot;$(dirname &quot;${BASH_SOU=
RCE[0]}&quot;)&quot; &amp;&amp; pwd)&quot;<br>
+=C2=A0 =C2=A0 export VCONTAINER_DIR<br>
+fi<br>
+BASHREFINE<br>
=C2=A0 =C2=A0 =C2=A0cat &gt;&gt; $script &lt;&lt;&#39;FOOTER&#39;<br>
<br>
=C2=A0echo &quot;vcontainer environment configured.&quot;<br>
@@ -395,11 +432,19 @@ echo &quot;&quot;<br>
=C2=A0echo &quot;Architectures: ${VCONTAINER_ARCHITECTURES}&quot;<br>
=C2=A0ENVEOF<br>
<br>
-=C2=A0 =C2=A0 # Unset OECORE_NATIVE_SYSROOT to avoid confusing other Yocto=
 tools<br>
-=C2=A0 =C2=A0 # (same pattern as buildtools-tarball)<br>
-=C2=A0 =C2=A0 echo &#39;&#39; &gt;&gt; $script<br>
-=C2=A0 =C2=A0 echo &#39;# Clean up - unset to avoid confusing other Yocto =
tools&#39; &gt;&gt; $script<br>
-=C2=A0 =C2=A0 echo &#39;unset OECORE_NATIVE_SYSROOT&#39; &gt;&gt; $script<=
br>
+=C2=A0 =C2=A0 # Gated unset: same pattern as buildtools-tarball (unset<br>
+=C2=A0 =C2=A0 # OECORE_NATIVE_SYSROOT after interactive sourcing so it doe=
sn&#39;t confuse<br>
+=C2=A0 =C2=A0 # other Yocto tools), but guarded behind an `if` so the auto=
builder&#39;s<br>
+=C2=A0 =C2=A0 # line-based parser (which matches &quot;unset &quot; only a=
t column 0) leaves<br>
+=C2=A0 =C2=A0 # OECORE_NATIVE_SYSROOT set in the CI environment.<br>
+=C2=A0 =C2=A0 cat &gt;&gt; $script &lt;&lt;&#39;UNSET_BLOCK&#39;<br>
+<br>
+# Avoid confusing other Yocto tools post-source (matches buildtools-tarbal=
l).<br>
+# Gated so yocto-autobuilder-helper&#39;s parser leaves OECORE_NATIVE_SYSR=
OOT set.<br>
+if [ -n &quot;${BASH_SOURCE[0]:-}&quot; ]; then<br>
+=C2=A0 =C2=A0 unset OECORE_NATIVE_SYSROOT<br>
+fi<br>
+UNSET_BLOCK<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Replace placeholder with actual SDK_SYS<br>
=C2=A0 =C2=A0 =C2=A0sed -i -e &quot;s:@SDK_SYS@:${SDK_SYS}:g&quot; $script<=
br>
-- <br>
2.50.1 (Apple Git-155)<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9753): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9753" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9753</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/119042096/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/119042096/1050810</a><br>
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
</div>
</div>
</blockquote></div></div>

--00000000000068610a06508c18bb--

