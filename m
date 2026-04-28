Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB38FF885D
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 11:56:23 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11619.1777377377941166538
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 04:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gDinV3cf;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c70fb6aa323so3962528a12.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 04:56:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777377377; cv=none;
        d=google.com; s=arc-20240605;
        b=Ce+ZJK03nMX0RDPONMKziQS1ZaOXIWrsvYEt0HxDMti5rKBQtdmZqNIbS0CIP48Uvk
         CJtTF/JHUBquWWeZOKzUc/sRnCqtRXM+e44fbTY1d/VVNN//FIn/ipTQhCZZNXm4XE+V
         HM16oV9QKYVZQxOy1INSIyByxtvYwKyMpqlKXw0uVCx4KgwT2u/cgohnKr0MVEvZ0Jl9
         aeZ9ikCg0MLfJwWZeZqchXqa1UAljO5FhPrjh99zUbV2suemHpTX5tl/EWRlXDJslbY2
         s5XJ1nFY8jqKpx9/qT3wPZgT5g+4uxs48f3DAjT5G/1iMtkvVb23uqTADE678Wq2YiqE
         15FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1cCK65y4VhKDoo+elMD6iKu24LgG5c5+1mGZEOczCts=;
        fh=RlXFC4EVqiP0gvru7+OOCjvgFbfzQ6di88zFfkgPMyQ=;
        b=CmxrFpG5szpSAgnD4utxpZVlIUGpHKkR2ol6hi5aHe7t3r7m5Z7ZLidas7RDyk3AJv
         1/NdstArMcT6k66bLNQElz6VnQlnUI1v0FwXi/Tt9y96WuKyP545Lb4Sze34NOmvmKu/
         9cmYv8K0R5n9Mw0Eodvg1eQjG3o2bX1qjhC9B2gNDSt3Intl1587RUBn2Xi4WT9zsJiB
         XIgW1W4WOEh3RYXpeNh1+TrJM4wEEKGjT2tzjaagN1Z40EtMa9gW3mXJA02MoXjel6i+
         XT5MyeChNDLXoqB/YzwG8ilyLh/viH2CkCao/iuqN6gFnsy/T3BrFIpEb3/j4AqwkRj4
         dCzw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777377377; x=1777982177; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1cCK65y4VhKDoo+elMD6iKu24LgG5c5+1mGZEOczCts=;
        b=gDinV3cfqCsh50Ey6RWqqeCK1Yjy3ceG748JadxUvG55MLJz0sdF5brixT5ZqbE80I
         xRRJzBVgUOj33nM7Exy8rDSyu3fvhLTJN+pfLrv70TlObjyWY/UIyVzIBlb/hs2t82EM
         xj/C59uhQP8u5tQV2eH7LWZ8JpDp5z7LHQpcu/j6g3bJbKdP+4HvNyCBaNQgnQZJHxSm
         H8mrDQGn+mfXXyGJjzGlOWD1qhTaLm/+WC8nVFSbpgTs56j6G2/E5ycqBRo53rktkjMO
         FcYkQjA4xAS5AQoUVS6uDKpu0+/Z4atOad/djQ2YLOSGRLKNPx6Q02REoG2Qif9JzF8Q
         QstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777377377; x=1777982177;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cCK65y4VhKDoo+elMD6iKu24LgG5c5+1mGZEOczCts=;
        b=h4apCrD60aT9Lj+Kcfw+bj0JuANhtmYwFAz842VxJjnNWnre3uWVqwnXrxwbveE4ZD
         GmkG54WjYZu3pRrIf4wiImKUZd3J2ET4ppaX0rOIH5Idnylaj63QTFqD6+EGPYVzrROa
         /bVCXRVjPTBAb+6SGzoSNIVr8qrmXozlTSiF3EyBdqQ3ThmFiZ15ZT3nzBOaIJER/QxF
         2sxd33fJLOBnU4ABpCHQCfyr98oYEQagkB2cccgr/+0lewgIxOO4sWM7BhNczmnk/UCz
         vx2TjH4qblXD5FWaHV/vl5YxPfwM3c5TvTC7z4TOK3uQLzfuLfTRfudesoyhPT2b01Jz
         0ZzA==
X-Gm-Message-State: AOJu0YwM4+RR+xI0pLXGP9gqvsx8bW4AJaCxialS4m45SkKkojKCitCH
	Ia1PNwXkdymxvUYE+rQNk7MPCHf6Uzv0xevdcDFL3idRAQKKndNeGT4BTzcJbANVpPkyv845xGS
	fRGnvpx9xhSydTzRc+s4u0jxGjTMMFI4=
X-Gm-Gg: AeBDiev3MFp7AxvHgI4OrRzgfQRHmlnJ24j38H+MQqkn5GNWvY328NGlMKcqqgzfGy2
	kzs8xxbg6rvCn0sb3sZmWgAVhElv+jWfTfaY8O1IhEt+je7fihEVuDyoUa1N1yGaWvuz7wxdBiO
	EQpB9Qop2/i9qAD4PsLgGEFXC9s9DPThOhKh0XPi0nJt3n9rMYIcMAdlD5jATrX2pyyQh+hX5s2
	Z+3OPGm/riv1DjbFyw6o9NqabQm5oQaSX5dp+/+6hlRCIdshp4JtElKMJXvEYAA4ZQoXIvvk/J3
	BmQr93dYmoE7yK2X+lv86LhN1Rs9gQJU8WKaKRAWx8m/K7kkuJ8=
X-Received: by 2002:a05:6a20:7347:b0:39f:27ab:2438 with SMTP id
 adf61e73a8af0-3a39c2c7e48mr3436119637.48.1777377377183; Tue, 28 Apr 2026
 04:56:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1777337030.git.tim.orling@konsulko.com> <26a08ff9d76bb10e58a61d5ab0d136fa2023a3fb.1777337030.git.tim.orling@konsulko.com>
In-Reply-To: <26a08ff9d76bb10e58a61d5ab0d136fa2023a3fb.1777337030.git.tim.orling@konsulko.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 28 Apr 2026 07:56:05 -0400
X-Gm-Features: AVHnY4JBiTyR-dUJZk1TdkaM7Tizdm5U79FipuFwVqYQWva5sneEK2eFu1IDQFM
Message-ID: <CADkTA4P0nUrk8-sOBeubiOwEC0BJJQqpbAm8dSbg79CjtwEt_g@mail.gmail.com>
Subject: Re: [meta-virtualization] [RFC PATCH 4/4] vcontainer-tarball: fix SDK
 environment script for CI
To: ticotimo@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000032ece7065083eb31"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 11:56:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9771

--00000000000032ece7065083eb31
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 9:13=E2=80=AFPM Tim Orling via lists.yoctoproject.o=
rg
<ticotimo=3Dgmail.com@lists.yoctoproject.org> wrote:

> When running in an AutoBuilder context, the variables are stripped
> since the script is not actually "sourced", but rather parsed.
>
> This resulted in VCONTAINER_DIR being empty and therefore no
> 'vdkr', 'vpdmn' and friends available to run in CI builder steps.
>

 Tim,

I agree the autobuilder's Python parser can't handle our bash-oriented
environment script, but I'd rather not add this much complexity to make
one script serve both environments.

The inline if [ -n "${BASH_SOURCE[0]:-}" ] guards and dual-path logic
make the script harder to reason about  and maintain.

Instead, I think we should generate two scripts:

  1. environment-setup-* (existing) =E2=80=94 stays as-is, pure bash, BASH_=
SOURCE
based, for interactive/devshell use
  2. environment-setup-ci =E2=80=94 flat export FOO=3D"/absolute/path" line=
s with
baked-in paths, no shell variable references, no unset, specifically for
the autobuilder's enable_tools_tarball() parser

The CI script would be simple:

  export VCONTAINER_DIR=3D"/opt/poky/sysroots/x86_64-pokysdk-linux"
  export OECORE_NATIVE_SYSROOT=3D"/opt/poky/sysroots/x86_64-pokysdk-linux"
  export
PATH=3D"/opt/poky/sysroots/x86_64-pokysdk-linux:/opt/poky/sysroots/x86_64-p=
okysdk-linux/usr/bin:/usr/bin:/bin"

SDK relocation rewrites the absolute paths at install time. The autobuilder
helper would reference this file instead of the bash one. No conditional
logic, no dual-purpose complexity.

Would this work with the autobuilder helper's enable_tools_tarball()?

If so I can implement it.

Bruce



>
> AI-Generated: Claude Cowork Opus 4.7
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  .../vcontainer/vcontainer-tarball.bb          | 69 +++++++++++++++----
>  1 file changed, 57 insertions(+), 12 deletions(-)
>
> diff --git a/recipes-containers/vcontainer/vcontainer-tarball.bb
> b/recipes-containers/vcontainer/vcontainer-tarball.bb
> index ed9b8e13..9564164c 100644
> --- a/recipes-containers/vcontainer/vcontainer-tarball.bb
> +++ b/recipes-containers/vcontainer/vcontainer-tarball.bb
> @@ -353,20 +353,57 @@ EOF
>
>  script=3D${SDK_OUTPUT}/${SDKPATH}/environment-setup-${REAL_MULTIMACH_TAR=
GET_SYS}
>
>      # Create environment script
> -    # Set OECORE_NATIVE_SYSROOT temporarily for SDK relocation, then
> unset it
> -    # (like buildtools-tarball does to avoid confusing other Yocto tools=
)
> +    #
> +    # The script is written so that it works both when sourced by bash
> (the
> +    # normal interactive / devshell case) AND when "installed" by
> +    # yocto-autobuilder-helper's enable_tools_tarball() in CI, which doe=
s
> NOT
> +    # source the file with bash -- it parses line by line in Python and
> only
> +    # honours lines that start with "export " or "unset " at column 0, a=
nd
> +    # only substitutes $PATH (see
> yocto-autobuilder-helper/scripts/utils.py).
> +    #
> +    # Consequences:
> +    #  - The primary VCONTAINER_DIR / OECORE_NATIVE_SYSROOT / PATH value=
s
> must
> +    #    be emitted as plain `export FOO=3D"<absolute-path>"` lines with=
 the
> +    #    absolute paths baked in at build time via Yocto variables
> +    #    (${SDKPATH}, ${SDKPATHNATIVE}). Yocto SDK relocation rewrites
> these
> +    #    paths at install time (via the installer's -d <dir> argument).
> +    #  - PATH must not reference $VCONTAINER_DIR / $OECORE_NATIVE_SYSROO=
T
> via
> +    #    shell indirection (the Python parser won't expand them); inline
> the
> +    #    absolute paths there too.
> +    #  - Any bash-only refinement (BASH_SOURCE-based relocation, final
> +    #    unset of OECORE_NATIVE_SYSROOT) lives inside an `if` block so t=
he
> +    #    Python parser ignores it, while real bash still executes it.
>      cat > $script <<'HEADER'
>  #!/bin/bash
>  # vcontainer environment setup script
>  # Source this file: source environment-setup-none
>  # Or use the symlink: source init-env.sh
> -
> -VCONTAINER_DIR=3D"$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
>  HEADER
> -    # Yocto variables (${SDK_SYS}, ${SDKPATHNATIVE}) expand at parse tim=
e
> -    # Shell variables use $VAR to avoid Yocto expansion
> +    # Primary env vars: emit as plain `export FOO=3D"<abs-path>"` so the
> +    # yocto-autobuilder-helper Python parser picks them up. Yocto
> variables
> +    # expand at bitbake time; the SDK installer's relocation pass rewrit=
es
> +    # the baked-in paths at install time.
> +    echo '' >> $script
> +    echo '# Primary values -- literal absolute paths that survive parsin=
g
> by' >> $script
> +    echo '# yocto-autobuilder-helper enable_tools_tarball() (not sourced
> by bash).' >> $script
> +    echo '# SDK relocation at install time rewrites the absolute paths
> below.' >> $script
> +    echo 'export VCONTAINER_DIR=3D"'"${SDKPATH}"'"' >> $script
>      echo 'export OECORE_NATIVE_SYSROOT=3D"'"${SDKPATHNATIVE}"'"' >> $scr=
ipt
> -    echo 'export
> PATH=3D"$VCONTAINER_DIR:$OECORE_NATIVE_SYSROOT/usr/bin:/usr/bin:/bin:$PAT=
H"'
> >> $script
> +    echo 'export
> PATH=3D"'"${SDKPATH}"':'"${SDKPATHNATIVE}"'/usr/bin:/usr/bin:/bin:$PATH"'=
 >>
> $script
> +
> +    # Bash-only refinement: if the file is actually being sourced by bas=
h,
> +    # re-derive VCONTAINER_DIR from the real on-disk location so a
> manually
> +    # moved/copied tarball still works. Invisible to the autobuilder
> Python
> +    # parser (doesn't start with export/unset at column 0).
> +    cat >> $script <<'BASHREFINE'
> +
> +# When sourced by bash (interactive / devshell), prefer the real on-disk
> +# location so a manually-moved tarball still works.
> +if [ -n "${BASH_SOURCE[0]:-}" ]; then
> +    VCONTAINER_DIR=3D"$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
> +    export VCONTAINER_DIR
> +fi
> +BASHREFINE
>      cat >> $script <<'FOOTER'
>
>  echo "vcontainer environment configured."
> @@ -395,11 +432,19 @@ echo ""
>  echo "Architectures: ${VCONTAINER_ARCHITECTURES}"
>  ENVEOF
>
> -    # Unset OECORE_NATIVE_SYSROOT to avoid confusing other Yocto tools
> -    # (same pattern as buildtools-tarball)
> -    echo '' >> $script
> -    echo '# Clean up - unset to avoid confusing other Yocto tools' >>
> $script
> -    echo 'unset OECORE_NATIVE_SYSROOT' >> $script
> +    # Gated unset: same pattern as buildtools-tarball (unset
> +    # OECORE_NATIVE_SYSROOT after interactive sourcing so it doesn't
> confuse
> +    # other Yocto tools), but guarded behind an `if` so the autobuilder'=
s
> +    # line-based parser (which matches "unset " only at column 0) leaves
> +    # OECORE_NATIVE_SYSROOT set in the CI environment.
> +    cat >> $script <<'UNSET_BLOCK'
> +
> +# Avoid confusing other Yocto tools post-source (matches
> buildtools-tarball).
> +# Gated so yocto-autobuilder-helper's parser leaves OECORE_NATIVE_SYSROO=
T
> set.
> +if [ -n "${BASH_SOURCE[0]:-}" ]; then
> +    unset OECORE_NATIVE_SYSROOT
> +fi
> +UNSET_BLOCK
>
>      # Replace placeholder with actual SDK_SYS
>      sed -i -e "s:@SDK_SYS@:${SDK_SYS}:g" $script
> --
> 2.50.1 (Apple Git-155)
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9753):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9753
> Mute This Topic: https://lists.yoctoproject.org/mt/119042096/1050810
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

--00000000000032ece7065083eb31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 27, 2=
026 at 9:13=E2=80=AFPM Tim Orling via <a href=3D"http://lists.yoctoproject.=
org" target=3D"_blank">lists.yoctoproject.org</a> &lt;ticotimo=3D<a href=3D=
"mailto:gmail.com@lists.yoctoproject.org" target=3D"_blank">gmail.com@lists=
.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">When running in an AutoBuilder context, the variables are =
stripped<br>
since the script is not actually &quot;sourced&quot;, but rather parsed.<br=
>
<br>
This resulted in VCONTAINER_DIR being empty and therefore no<br>
&#39;vdkr&#39;, &#39;vpdmn&#39; and friends available to run in CI builder =
steps.<br></blockquote><div><br></div><div><div class=3D"gmail_default" sty=
le=3D"font-size:small">=C2=A0Tim,<br><br>I agree the autobuilder&#39;s Pyth=
on parser can&#39;t handle our bash-oriented</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">environment script, but I&#39;d rather not ad=
d this much complexity to make</div><div class=3D"gmail_default" style=3D"f=
ont-size:small">one script serve both environments.=C2=A0</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">The inline if [ -n &quot;${BASH_SOURCE[0=
]:-}&quot; ] guards and dual-path logic</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">make the script harder to reason about=C2=A0 and m=
aintain.<br><br>Instead, I think we should generate two scripts:<br><br>=C2=
=A0 1. environment-setup-* (existing) =E2=80=94 stays as-is, pure bash, BAS=
H_SOURCE based, for interactive/devshell use<br>=C2=A0 2. environment-setup=
-ci =E2=80=94 flat export FOO=3D&quot;/absolute/path&quot; lines with baked=
-in paths, no shell variable references, no unset, specifically for the aut=
obuilder&#39;s enable_tools_tarball() parser<br><br>The CI script would be =
simple:<br><br>=C2=A0 export VCONTAINER_DIR=3D&quot;/opt/poky/sysroots/x86_=
64-pokysdk-linux&quot;<br>=C2=A0 export OECORE_NATIVE_SYSROOT=3D&quot;/opt/=
poky/sysroots/x86_64-pokysdk-linux&quot;<br>=C2=A0 export PATH=3D&quot;/opt=
/poky/sysroots/x86_64-pokysdk-linux:/opt/poky/sysroots/x86_64-pokysdk-linux=
/usr/bin:/usr/bin:/bin&quot;<br><br>SDK relocation rewrites the absolute pa=
ths at install time. The autobuilder</div><div class=3D"gmail_default" styl=
e=3D"font-size:small">helper would reference this file instead of the bash =
one. No conditional logic, no dual-purpose complexity.<br><br>Would this wo=
rk with the autobuilder helper&#39;s enable_tools_tarball()?=C2=A0</div><di=
v class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D=
"gmail_default" style=3D"font-size:small">If so I can implement it.<br><br>=
Bruce<br></div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0</div></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
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

--00000000000032ece7065083eb31--

