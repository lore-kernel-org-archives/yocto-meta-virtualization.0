Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F21AC44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 20:52:49 +0000 (UTC)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7892.1784580767399611696
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jul 2026 13:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sUfWaHBp;
 spf=pass (domain: gmail.com, ip: 209.85.221.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5bf8e1edc3aso3362305e0c.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jul 2026 13:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784580766; x=1785185566; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1HxdqGgA8fyKY+jSOg3C6dTPQna2Z7TjU4QgfsqER3g=;
        b=sUfWaHBpaK2FA/s3UO1J8+TqMZAbY94q3lD4/dHc52Gohg+EsRnBKlm3uxaIVYhAbB
         v6/GUW0oioZRvmN3i38kKEmDO0s5ivIaw2RzepPqTrz4t6DNOZzzTr/JP4xHB3VH2ZqX
         yM+8esIdRhhEZ5j+qP0vwAA3OZmru6s8wFr2SuyQKeLc/+PcBftkGm5BHh2MAthpJQYp
         fV6rD7fcMJZByDTZSPWg0hv5jmsLhYiHNQAwylB3jg0qv+oy/UOqEELaQY/IUffeease
         zGG7XV49etQRXLRwk62HhdBeXs9SVcOGNHvmjkz420TIKpe4j3DFMaeuEPBSvqatUD36
         VmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784580766; x=1785185566;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1HxdqGgA8fyKY+jSOg3C6dTPQna2Z7TjU4QgfsqER3g=;
        b=gXRH6GRw5n3f3RCH3MkMmZOBVBU+Fn2ZDXmiwuYAhfRYX1RK/57H71b6okeQEmoGR4
         nGU/AwCT/MutIDKUMMX6RABENLiwvVag6DFJ8yK+CyFUE/vh15PtL9d3EyshoG3gsVlF
         eQ1n/npPI8+gt4C1OMzqGqoC37Cv7tdoZhTuMLDWcU3i0Jb0Ttu1IXB0jOD8+LEt1DMU
         0hzCa2lf8mq2f2Bet62Jf51CJ5dID85ZVcUhxvutm/TgffnX/bUheRR0mYaAJqLs2NYS
         /6IRF4dE39AjsqsAn4a0eCz9vECHb5X0QKYxeuqcVx4cG3oEnU8T+CHTbJJ6dyOyTwHL
         5UKA==
X-Forwarded-Encrypted: i=1; AHgh+RrfV8oqiKhuTHgqmuiGokzRFnY0qepbCPZnhkyBJYW7VsVzDS3VKs3XL0lEeOd+VJaiMi32x6OvweXVNw9XG/ryd6hW@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzLABTH9YMQGgAjC/BXpfA94cqN5PvKcnuFty3Nq35P1Ll3ykYx
	J76qzYwm7wIKxkzEOYF40HFWOWJeqU3twgJQv03UIopxM7RyXI327mQy
X-Gm-Gg: AfdE7cknH1jd7gJHeS+kkzOSuEDO6h2jpieS7TJkmC+5Xf5nR/4oErfHQUC3ixt3AS6
	klVcHXHgjMGLP2Sz7dRgvV3D1CgzotfwAf43gI+dlg/9d2HGsqUFfu8ZaOUPL3Ffqo6XHnN3/Fv
	mCo7f3yC2Y+jakJpFyrXWhpdcKdJQTtlpiu1VAFob96QRIF9Ekk0000VE1tZhdylngUgOqPsJSl
	m9hSyt5BFf3XzxoVgQQNXwgSk8LY5rT3Opr8Ntk2QDfK90CSLzh3J+9k69ir77EkYgTK1nDYPxN
	orjuCw9s2pspWKzKrJXsTTmrJ+JB8tEEyk2HcJfIH20YzL8T0rCAf9nsl+7QiGyu2JKKJjOYVBV
	dMx0hLZuo5uE3qIIfilyhFfyIABjVIy7GjrqlySECrJ+LqnUZx854cAqZEYU6JjZOsf0PVypO9d
	ejAJRmoJ+sossIZIoc4hSoOlIVI5hpjLuITacM2O9dmlRm0Z1PqIWKfpF9U2+xgQJTh7cWaXYhu
	2e3XJzqT0BpfKoTCvuUV9pE5uFLNNHTsvDmjV8KG2dbZvkkRRC0sbFhb3E6iGyoUMaFwgfcNLay
	x8w=
X-Received: by 2002:a05:6122:4085:b0:55b:d85:5073 with SMTP id 71dfb90a1353d-5c1b6646347mr4567991e0c.4.1784580766097;
        Mon, 20 Jul 2026 13:52:46 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c1eee1417dsm10420920e0c.5.2026.07.20.13.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 13:52:45 -0700 (PDT)
Message-ID: <6a5e8a9d.ec7609bc.1985ef.8845@mx.google.com>
Date: Mon, 20 Jul 2026 13:52:45 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: ticotimo@gmail.com, meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH v2 00/13] Container Improvements
In-Reply-To: <cover.1783356922.git.tim.orling@konsulko.com>
References: <cover.1783356922.git.tim.orling@konsulko.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jul 2026 20:52:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9959

Hi Tim,

Thanks for the substantial rework. Reviewed the whole series against the
v1 comments, and the two new pieces you factored out (container-volatile-fixup
and container-dev-mode) look great. Series has been applied on master.

Here's my summary, just so we can have it archived and use it as a reference
later if something breaks:

v1 items — status
-----------------

Addressed:

  * EXTRA_USERS_PARAMS uses += now (was = in v1)
  * PYEOF single-quoted heredoc has the "bitbake pre-expansion" comment
  * NONROOT_USER bare-identifier requirement documented
  * fix_oci_home_perms has the index.json guard + OCI_IMAGE_TAR_OUTPUT
    gate + bbfatal if the layout ever changes
  * IMAGE_INSTALL is no longer duplicated against OCI_LAYERS packages
    across the image recipes (image-oci auto-derivation on master
    handles it)
  * rootfs_fixup_var_volatile is factored into
    container-volatile-fixup.bbclass and app-container-python inherits
    it (was missing in v1)
  * container-dev-mode.bbclass cleans up the '-dev' boilerplate that
    each recipe previously repeated
  * app-container-valkey's persistence paths (/data, /var/lib/valkey,
    /var/log/valkey, /run/valkey) are in NONROOT_OWNED_DIRS
  * The valkey security-caveats item is moot in v2 — the
    container-entrypoint.sh design supersedes the always-on
    protected-mode override I had asked to be flagged in DESCRIPTION

I did notice a few things on the way through, but it was more efficient
if I just did them myself.

All three are behavior-neutral cleanups:

1. app-container-valkey: drop redundant OCI_IMAGE_RUNTIME_UID

   The recipe carries a verbatim copy of the same
     OCI_IMAGE_RUNTIME_UID = "${@bb.utils.contains('PACKAGECONFIG',
                                'dev', '0', '${NONROOT_UID}', d)}"
   line that container-dev-mode.bbclass now supplies. Leftover from v1.

2. app-container-mosquitto: fix PACKAGECONFIG 'dev' comment

   The block above PACKAGECONFIG was copied from app-container-python
   and mentions python3-pip / site-packages /
   pn-app-container-python — none of which apply. Rewrote it per-recipe.
   nginx and curl in the same series already have the correct wording.

3. container-nonroot-user.bbclass: document + assert inherit order

   oci_nonroot_inject_user() is a do_image_oci prefunc that reads
   OCI_LAYER_*_ROOTFS. Those vars are populated by image-oci's OWN
   do_image_oci prefunc (oci_multilayer_install_packages), and prefunc
   execution follows inherit order. If a future recipe inherits
   container-nonroot-user before image-oci, injection runs against
   empty per-layer state, no layer ships /etc/passwd, and the only
   signal is a bb.warn that reviewers can miss. Added a header comment
   spelling out the requirement + an anonymous-python guard that
   raises bb.fatal at parse time. All five in-tree consumers already
   inherit in the right order, so this catches a future mistake rather
   than fixing a current one.

Also — the cover letter says "verify '-dev' mode switches from root
user to mosquitto user", but the recipe doesn't set
NONROOT_USER = "mosquitto" (unlike nginx which does set it to "nginx").
So either the cover letter is aspirational or something is happening
implicitly that I'm missing. Any changes we can do on top of the
series. I've put it on master-next for visibility.

Bruce

