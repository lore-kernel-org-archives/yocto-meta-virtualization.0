Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web10.1390.1583179771159226666
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Mar 2020 12:09:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kmA2y8Uy;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id e25so1326510edq.5
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 02 Mar 2020 12:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eXsSMISXjuZz69WVKUb0wnghxgHtUYrWE2UxqjgnxmI=;
        b=kmA2y8UyLiAY5kW4xvT3EqCkfMrMCMuvbQQJnlW9GPhz9/ZKvbyHtVOrdD0N+vCah7
         S1sFlof1LtRIvb/mDexfuVFgjZkCB6HB2FoCl0h+RU/q6LkDeuyfRW7GF3QDSgXOB9qJ
         HjBFhpeAmTgbj6rNT6n7VcPGBb99fDw1vWy5V58pM6BRSKQcsEEJ18BxVH1CzRmyt3T+
         b6HnNpesaF6qpM5k1Q2onNV89Fs1aDMVF+Qb2O5z6Qi9pnbuJKyhEElXAGl74nuiZa5r
         F24ScOWUY7r3ukF/3rSrSZVC3sI4gUVTp3clZscT22l5mRJY77u3ntZ1/v4t2UIIAfl1
         ihxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eXsSMISXjuZz69WVKUb0wnghxgHtUYrWE2UxqjgnxmI=;
        b=Y3Up/4SdM38Ob/cgYB1TyTpVShufahRZSLbCTqsDqR0vGdGWVsGXNDwar9E9HY0NXJ
         lsJKCLMoLNiNuMASgXzi5rlUMHTowekLs6lri3dq9Pp3pLAGGBu8V4a8bWVDaM5nLFaZ
         ZN/mO15npogs41zvgVubED5S7zniK4+p1aMXVB4Wo5QB9OPWHBX3k3xOvpiQ3gLS8N1n
         JQWD6Oti602lxhgtvCNIQs4UdsopVgq9uzWBs9s0wWrjtrltETk1FaYs7EbtE9Z/nJxG
         M+732q9rKs221rilvZ9jwGViBWLvb7HXs2giDh/fze3TGmaRq0LsYgS2uqZSrkGxMpfe
         ZkLw==
X-Gm-Message-State: ANhLgQ2WZuCCqe0h3DuXI337R/0ssDK72iOw36E+ehT7hfcCFaSQSfIb
	y/2K7qnfRYMyQGjKn2ogXwNeo1sQ8tC7tLsX01nPOViW
X-Google-Smtp-Source: ADFU+vs8bCtZ9rSUWquxyp/wxQ+v1CLELlVVlYSyxYD3MzBZlE6oeyHWveqRiUnVKVNM6E7SPVS2RBCh912K1G/r5Qg=
X-Received: by 2002:a17:906:4bc8:: with SMTP id x8mr889753ejv.339.1583179769651;
 Mon, 02 Mar 2020 12:09:29 -0800 (PST)
MIME-Version: 1.0
References: <1583119946-260471-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1583119946-260471-1-git-send-email-changqing.li@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 2 Mar 2020 15:09:18 -0500
Message-ID: <CADkTA4N4K=hoJ1vo_NfHpUqT0xCzYV0pWZk2mvpOVWdtH=aatQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] openvswitch-git: refresh patch to fix patch-fuzz warning
To: Changqing Li <changqing.li@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Sun, Mar 1, 2020 at 10:32 PM Changqing Li <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  ...vswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch
> index a8fc86c..fc74deb 100644
> --- a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch
> +++ b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch
> @@ -13,6 +13,8 @@ Fix ptest for v2.5
>
>  Signed-off-by: He Zhe <zhe.he@windriver.com>
>
> +refresh patch to fix patch-fuzz warning
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>  ---
>   Makefile.am |  1 +
>   test.mk     | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> @@ -23,8 +25,8 @@ diff --git a/Makefile.am b/Makefile.am
>  index 7889728..6435399 100644
>  --- a/Makefile.am
>  +++ b/Makefile.am
> -@@ -494,3 +494,4 @@ include windows/automake.mk
> - include ovn/automake.mk
> +@@ -497,3 +497,4 @@ include windows/automake.mk
> + include windows/automake.mk
>   include selinux/automake.mk
>   include build-aux/automake.mk
>  +include test.mk
> --
> 2.7.4
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
