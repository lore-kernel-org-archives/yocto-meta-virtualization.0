Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE7BCDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 18:06:32 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.134523.1697479588009102685
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 11:06:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WtPcALdu;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-79fe6da0049so195077839f.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Oct 2023 11:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697479587; x=1698084387; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztvzauPJKG8ZhKpNTfHhETETMJ8SZCj3W6l2cJ3AwnQ=;
        b=WtPcALduvCQqr6F0Zajn1Rmv7Rc5Wnwee+SJHbv9TflRtrxokY1qiZhy5PI2z/1hXw
         ccfayLafab26PO8gpd8T8MBOb1MAtXy+GsfFO7jreohAaQeM38TeczcAYMM4P1SZzHTT
         q0hLgFK3FCBKdhWZguq9xQlVj8E/EmOsb8eWp27JdBdIlPzGZ4ijCd2K6Za3hiJjIqaJ
         nWtmfMfjQTWa4yF0vus3k2L9Tp0aRhw7OTkRb8NR6yGRPzp+P+gTvHKrLs9pGvjxbBuo
         /EDJIqS+EcbF5OALn+IOpvVXeEwBLdEh6hCNYYr+YOBgksZ9oSyGVzOSiKjuFxDm50hR
         O06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697479587; x=1698084387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ztvzauPJKG8ZhKpNTfHhETETMJ8SZCj3W6l2cJ3AwnQ=;
        b=E7SSGg9bfnpno1AZ4RqHhQ2JRHkc6VmZ2Kq1Hn96x5peB74BfDDKk7PdwBP8dfIvtj
         6BAzsdNAHnW88GJVzM7lP8JX5AaIdi7A1hanYbFPGZVYL470qJJcw40dE/kMPV9Hl1h4
         CyAyj0HLsbAatluK9svvCASQpoF62RpD271vBS1E5YkBcoRFPRucsO/WvIve4sG2OuSR
         kGuoxxakDhZZ98vEdUuVStc35mh4KUPH/bXYO5hwSbxG35DKgCxSdBDCWF8r1JcGE6E2
         1mJgQLn0eeLWiTWyHd9QGcAzhOd/nevAF+k18FVEPKvlxInFOrk+kpyJfLFb8Id/dXUB
         X5rA==
X-Gm-Message-State: AOJu0YzomtevbXkHIDr0DRGbRUdtnzn9QwOHiGU7LqE0HCpVXn/Y/seh
	wtxpysZBENAI43C9nFFPr6selvLCA8V/rMY3X14=
X-Google-Smtp-Source: AGHT+IGA8A2QgYMHA0Dv1r/MBdqWjzlW+btCjr2eG+tikOy67F+AtJy8LxebffauBMKVwzy4SFZ2sq407pwbesLUSvA=
X-Received: by 2002:a6b:5b16:0:b0:7a2:a6db:9a58 with SMTP id
 v22-20020a6b5b16000000b007a2a6db9a58mr40387923ioh.15.1697479587159; Mon, 16
 Oct 2023 11:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <20231004160212.3574826-1-JPEWhacker@gmail.com>
In-Reply-To: <20231004160212.3574826-1-JPEWhacker@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 16 Oct 2023 14:06:30 -0400
Message-ID: <CADkTA4PN1AHnObAX+p+rR0fCH+yj+q6O9SArs22-XZQpzfEU0Q@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] classes/image-oci-umoci: Replace ":"
 in image file name
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Oct 2023 18:06:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8369

On Wed, Oct 4, 2023 at 12:02=E2=80=AFPM Joshua Watt <JPEWhacker@gmail.com> =
wrote:
>
> The OCI_IMAGE_TAG variable can contain a ":" if the user wants to give
> the image a name and a tag, as in:
>
>     OCI_IMAGE_TAG =3D "${IMAGE_BASENAME}:latest"
>
> However, while this is valid for tag name, the ":" is illegal in OCI
> image file names so replace it with "_" when naming the symlinks

I haven't experimented with this yet, but as I mentioned on IRC
some time ago, we really don't want to change the symlinks
unless absolutely possible.

I'm still trying to understand the first RFC patch before getting into
the question of the symlink.

But my question on this is ... who / what is declaring it illegal to
have a : on the symlink name ? Is one of the OE/bitbake
components ? umoci ? podman ? something else ?

Bruce

>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  classes/image-oci-umoci.inc | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
> index 58e4668..adca6c1 100644
> --- a/classes/image-oci-umoci.inc
> +++ b/classes/image-oci-umoci.inc
> @@ -105,6 +105,10 @@ IMAGE_CMD:oci() {
>      fi
>      umoci config --image $image_name:${OCI_IMAGE_TAG} --author ${OCI_IMA=
GE_AUTHOR_EMAIL}
>
> +    # OCI_IMAGE_TAG may contain ":", but these are not allowed in OCI fi=
le
> +    # names so replace them
> +    image_tag=3D"${@d.getVar("OCI_IMAGE_TAG").replace(":", "_")}"
> +
>      # make a tar version of the image direcotry
>      #  1) image_name.tar: compatible with oci tar format, blobs and root=
fs
>      #     are at the top level. Can load directly from something like po=
dman
> @@ -118,13 +122,13 @@ IMAGE_CMD:oci() {
>         tar -cf "$image_name-dir.tar" "$image_name"
>
>         # create a convenience symlink
> -       ln -sf "$image_name.tar" "${IMAGE_BASENAME}-${OCI_IMAGE_TAG}-oci.=
tar"
> -       ln -sf "$image_name-dir.tar" "${IMAGE_BASENAME}-${OCI_IMAGE_TAG}-=
oci-dir.tar"
> +       ln -sf "$image_name.tar" "${IMAGE_BASENAME}-$image_tag-oci.tar"
> +       ln -sf "$image_name-dir.tar" "${IMAGE_BASENAME}-$image_tag-oci-di=
r.tar"
>      fi
>
>      # We could make this optional, since the bundle is directly runnable=
 via runc
>      rm -rf $image_bundle_name
>
>      # This is the OCI image directory, which is technically the "image" =
as specified
> -    ln -sf $image_name ${IMAGE_BASENAME}-${OCI_IMAGE_TAG}-oci
> +    ln -sf $image_name ${IMAGE_BASENAME}-$image_tag-oci
>  }
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8336): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8336
> Mute This Topic: https://lists.yoctoproject.org/mt/101758365/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

