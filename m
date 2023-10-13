Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 959FACDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 16:58:31 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web11.44064.1697216303284659854
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 13 Oct 2023 09:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mnTUe5Kj;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-79fa891b645so85283539f.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 13 Oct 2023 09:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697216302; x=1697821102; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/p3M/QzZh37vw0jWcdvbHiRyts6EAn8KYUazw6R+ZU=;
        b=mnTUe5KjWJeTrxP1FIByXum0EOfblPnxl0My4Jr0fVydYbdq0DlTF3lKamwZ2Pbiei
         r4pvRR/plsc2c6de4a11BvFIP8Q7TwCnwBuwhZW9jdLHaXZijDfekMsM4EbAYayknuMZ
         Dg5Uh9BCpYdWiMlTPB7AfS2wI2VAX4z37p1vDa/yklrBXTb6c34Uexvwy8AdcttTSOKX
         XN5uXasvfk+6BisFsohKGZYzAEl+7qrlLvt4fIc7ZW1NlrupoIUqi/NV6nBaJOTLQQ7x
         OrRi/N14xMFH1AD3IudwpLk0MuQpVNlz4hRrYzOIr7+iRN21u/LWzfUpNFJuB5sje6r4
         l5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697216302; x=1697821102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/p3M/QzZh37vw0jWcdvbHiRyts6EAn8KYUazw6R+ZU=;
        b=oVdPNsYg0D5XF81r747tm9tlcELJXqiZStb/hVIrxk8kjaoNEgOwglvJ1wV0GZM9rW
         MVStNQoZkSrSfXLqPekYrRRiBrDXSkGuwj29nKNAxJZDujiM9HnPrBLs4ohv1s0iq8tM
         JO1vJBN6nMymay4vyT0rUjhqFfB69ESg5e80fDBGWqzFfxWgdzOv9/MjhCz7Ce8LIYhT
         7hNQtqP2X7NTsYguSduaFtzHEO8JB+l5EoTAauYh1DfnFFdTpMo5vgir+PnRKfHtE5UA
         2vfc+giwJXlmTqKmrwA4OSXihJlyE9M76U33/zn89o/+TEUrSfKHVwp6YgKvZF7AHddt
         lIdA==
X-Gm-Message-State: AOJu0Yw2WAr0gbS5/Iz7sipZNQDV+Roi2F6TBOSaVzxjj+s7W+a+kDVL
	s55r+JfjXG6udnNE+w2fO2cR0bBwDA5d0xMbEDI=
X-Google-Smtp-Source: AGHT+IHvfxJzAzeKcSNzlOjx6kMwJB8+68U6UAItrpRTpj3+kqF7gtWmX2biW86PfHR/DaDndzV5Uv5/N4PYz4F3gAQ=
X-Received: by 2002:a5e:8811:0:b0:792:4cfc:178f with SMTP id
 l17-20020a5e8811000000b007924cfc178fmr29552607ioj.16.1697216302270; Fri, 13
 Oct 2023 09:58:22 -0700 (PDT)
MIME-Version: 1.0
References: <20231012162548.329780-1-JPEWhacker@gmail.com> <20231013153807.906542-1-JPEWhacker@gmail.com>
In-Reply-To: <20231013153807.906542-1-JPEWhacker@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 13 Oct 2023 12:58:10 -0400
Message-ID: <CADkTA4O-9_7c6iKoHP_vfDhfojqoY19VHK5p_kt7Ktybm1s2_w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2] classes/image-oci-umoci: Handle
 mutliple entrypoint arguments
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 13 Oct 2023 16:58:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8363

On Fri, Oct 13, 2023 at 11:38=E2=80=AFAM Joshua Watt <JPEWhacker@gmail.com>=
 wrote:
>
> The entrypoint to a container is actually an array of the executable to
> run and the arguments to pass to it. It is useful to be able to specify
> the entire list as the entrypoint when creating containers so that
> then entrypoint can be encoded with argument, e.g.
>
>     ENTRYPOINT ["/usr/bin/python3", "my-script"]
>
> The current way that image-oci-umoci.bbclass handles this is equivalent
> to:
>
>     ENTRYPOINT ["/usr/bin/python3"]
>     CMD ["my-script"]
>
> But this is undesirable as it means if the user passes arguments when
> running the container, it will override the "my-script" argument and the
> arguments will instead get passed to the python interpreter, which may
> not be desired.
>
> Instead, pass all the entry point arguments to umoci in a single
> invocation using multiple --config.entrypoint arguments, which correctly
> make the list as described above. The entire ENTRYPOINT list will start
> with OCI_IMAGE_ENTRYPOINT, then have OCI_IMAGE_ENRTYPOINT_ARGS split by
> spaces concatenated after it.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  classes/image-oci-umoci.inc | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
> index 58e4668..245dae5 100644
> --- a/classes/image-oci-umoci.inc
> +++ b/classes/image-oci-umoci.inc
> @@ -99,10 +99,10 @@ IMAGE_CMD:oci() {
>         bbnote "OCI: image subarch is set to: ${OCI_IMAGE_SUBARCH}, but u=
moci does not"
>         bbnote "     expose variants. use sloci instead if this is import=
ant"
>      fi
> -    umoci config --image $image_name:${OCI_IMAGE_TAG} --config.entrypoin=
t ${OCI_IMAGE_ENTRYPOINT}
> -    if [ -n "${OCI_IMAGE_ENTRYPOINT_ARGS}" ]; then
> -       umoci config --image $image_name:${OCI_IMAGE_TAG} --config.cmd "$=
{OCI_IMAGE_ENTRYPOINT_ARGS}"
> -    fi
> +    umoci config --image $image_name:${OCI_IMAGE_TAG} \
> +       --config.entrypoint "${OCI_IMAGE_ENTRYPOINT}" \
> +       ${@" ".join("--config.entrypoint %s" % s for s in d.getVar("OCI_I=
MAGE_ENTRYPOINT_ARGS").split())}
> +


This is super close to what I badly tried to describe. I realize I could ha=
ve
 just done a patch to be clear, but it was a bit late and I just
wanted to get something out.

Do you think something like the following would meet your use case :

diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
index 58e4668..0d6c712 100644
--- a/classes/image-oci-umoci.inc
+++ b/classes/image-oci-umoci.inc
@@ -99,9 +99,10 @@ IMAGE_CMD:oci() {
        bbnote "OCI: image subarch is set to: ${OCI_IMAGE_SUBARCH},
but umoci does not"
        bbnote "     expose variants. use sloci instead if this is importan=
t"
     fi
-    umoci config --image $image_name:${OCI_IMAGE_TAG}
--config.entrypoint ${OCI_IMAGE_ENTRYPOINT}
+    umoci config --image $image_name:${OCI_IMAGE_TAG} \
+         ${@" ".join("--config.entrypoint %s" % s for s in
d.getVar("OCI_IMAGE_ENTRYPOINT").split())}
     if [ -n "${OCI_IMAGE_ENTRYPOINT_ARGS}" ]; then
-       umoci config --image $image_name:${OCI_IMAGE_TAG} --config.cmd
"${OCI_IMAGE_ENTRYPOINT_ARGS}"
+       umoci config --image $image_name:${OCI_IMAGE_TAG} ${@"
".join("--config.cmd %s" % s for s in
d.getVar("OCI_IMAGE_ENTRYPOINT_ARGS").split())}
     fi

That way you aren't forced to split your multi argument entrypoint
over two variables, and
we can still have arguments in that ARGS variable available to be
clobbered on container
start, etc.

I realize this is probably where you would have started if not for
concerns about backward compatibility, etc.
But looking at it more, it is easier to just convert both variables to
the repeated call to umoci. We are
leaving the variables themselves the same with space separated
arguments/entrypoint, so that is enough
backward compatibility for me.

Bruce


>
>      umoci config --image $image_name:${OCI_IMAGE_TAG} --author ${OCI_IMA=
GE_AUTHOR_EMAIL}
>
>      # make a tar version of the image direcotry
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8362): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8362
> Mute This Topic: https://lists.yoctoproject.org/mt/101942798/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

