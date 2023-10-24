Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DB6C25B47
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 18:59:42 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web11.26530.1698173972578566691
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 11:59:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aMwHL/7F;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-357cf6725acso10663985ab.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 24 Oct 2023 11:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698173972; x=1698778772; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBOR4rnt+6H5CRuZVeM0LF207QGG68mdlP7OgzfprUs=;
        b=aMwHL/7FnyiB1VsWuo+6ALgDy7pidibqBtWE6JehiJ1OkR8EsA4kpujZuPF/yIq2Tg
         /OzaqUuvDEn2+xFiWESnVCF7SP1A+oOpGSJenTNQCP6P4YvlbhFENAa3v1K2FCxG5n64
         OMY6acD6oxaiMD28SZV1EXJpBNZPx5wTSgxmkgEAW/JRmmMTbMULehgTLsYOpJxoYesU
         q7DiYETY1cWchR9mei6ir4sNe4mh0ru9Xi3hD54BbAGjmg7jH4TFv4vAirhLWq6VZ0T2
         iVG1lZvZIkYPno/5psSLjN0yE9ZlG4z0J8+OkYJ5zWlzOHQXD1m1eTFz8CiOLbP7VEQx
         57Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698173972; x=1698778772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iBOR4rnt+6H5CRuZVeM0LF207QGG68mdlP7OgzfprUs=;
        b=GaFaM+xAxt56H/EIwuY5oeaYb0YVsSIGB+dKHMT3EG4B/HxhOwUlCoZMMrTKeRqdaT
         /ffX5HXicfKXHm0uoY7lbB+gFBSYoynefDoKkvHcLz9AQoGNqOUhDO27IfuO5DMVOyke
         sVe1WYqoAxGnuWtd1MglGBP2qad5cwSnliqfLKpTHRphMhDYyCl6nKUPkl2CvcxAPZf1
         EODcmJqbp8bRQXrbbWNvqwVm2MWbdubiCs7UZuwfut1c+F0L5obr/RQjV+NyVg5JNAc4
         qjLJUYGctnrgKyPM5yOscgHMy9BKC8xap7l26XPcjrCIyF+u1LVda+HP2WnMyCPyiBWk
         4pPw==
X-Gm-Message-State: AOJu0Yy0N2RJtD1ZwSd+3ZE7brO3cLyP7TYzVTXrNjHpogx58ZSvL6dZ
	KaP0a84YYxxTli1reMSerQyVC3/9zqvEoD+Yh119HIVD
X-Google-Smtp-Source: AGHT+IGNNceXhLTstS+zg4y2gq8UskbZ9ouJGAs5B7Dp79/rTTnqa/IbmB3bJEkPV4fAw9xNf2mTU9oJRoBGsdL6WSI=
X-Received: by 2002:a05:6e02:1c2b:b0:34f:70ec:d4cf with SMTP id
 m11-20020a056e021c2b00b0034f70ecd4cfmr16643553ilh.8.1698173971713; Tue, 24
 Oct 2023 11:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20231004160212.3574826-1-JPEWhacker@gmail.com>
 <CADkTA4PN1AHnObAX+p+rR0fCH+yj+q6O9SArs22-XZQpzfEU0Q@mail.gmail.com> <CAJdd5GZi3=XLOAJ0o1jOyq_-+MkwLqFp137_vy5wf0S4QBRLZA@mail.gmail.com>
In-Reply-To: <CAJdd5GZi3=XLOAJ0o1jOyq_-+MkwLqFp137_vy5wf0S4QBRLZA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 24 Oct 2023 14:59:20 -0400
Message-ID: <CADkTA4PTumf3CwjVe_MFi6tumB1+1a2iJrkCTvhvBwA00AHPwg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] classes/image-oci-umoci: Replace ":"
 in image file name
To: Joshua Watt <jpewhacker@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 24 Oct 2023 18:59:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8390

On Mon, Oct 16, 2023 at 2:35=E2=80=AFPM Joshua Watt <jpewhacker@gmail.com> =
wrote:
>
>
>
> On Mon, Oct 16, 2023, 12:06=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gma=
il.com> wrote:
>>
>> On Wed, Oct 4, 2023 at 12:02=E2=80=AFPM Joshua Watt <JPEWhacker@gmail.co=
m> wrote:
>> >
>> > The OCI_IMAGE_TAG variable can contain a ":" if the user wants to give
>> > the image a name and a tag, as in:
>> >
>> >     OCI_IMAGE_TAG =3D "${IMAGE_BASENAME}:latest"
>> >
>> > However, while this is valid for tag name, the ":" is illegal in OCI
>> > image file names so replace it with "_" when naming the symlinks
>>
>> I haven't experimented with this yet, but as I mentioned on IRC
>> some time ago, we really don't want to change the symlinks
>> unless absolutely possible.
>>
>> I'm still trying to understand the first RFC patch before getting into
>> the question of the symlink.
>>
>> But my question on this is ... who / what is declaring it illegal to
>> have a : on the symlink name ? Is one of the OE/bitbake
>> components ? umoci ? podman ? something else ?
>
>
> Skopeo and podman both have this restriction. They allow specifying a tag=
 inside an image with a :tag suffix, so you can't have an OCI file/director=
y named "foo:latest" because they assume that means a file/directory named =
"foo" and the tag "latest" inside it.

Fair enough. I'll run some of my own experiments with tags that
are in the format you are using.

But given that this could cause issues with tags, I'm leaning
towards taking the patch as-is.

bruce

>
>>
>> Bruce
>>
>> >
>> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> > ---
>> >  classes/image-oci-umoci.inc | 10 +++++++---
>> >  1 file changed, 7 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
>> > index 58e4668..adca6c1 100644
>> > --- a/classes/image-oci-umoci.inc
>> > +++ b/classes/image-oci-umoci.inc
>> > @@ -105,6 +105,10 @@ IMAGE_CMD:oci() {
>> >      fi
>> >      umoci config --image $image_name:${OCI_IMAGE_TAG} --author ${OCI_=
IMAGE_AUTHOR_EMAIL}
>> >
>> > +    # OCI_IMAGE_TAG may contain ":", but these are not allowed in OCI=
 file
>> > +    # names so replace them
>> > +    image_tag=3D"${@d.getVar("OCI_IMAGE_TAG").replace(":", "_")}"
>> > +
>> >      # make a tar version of the image direcotry
>> >      #  1) image_name.tar: compatible with oci tar format, blobs and r=
ootfs
>> >      #     are at the top level. Can load directly from something like=
 podman
>> > @@ -118,13 +122,13 @@ IMAGE_CMD:oci() {
>> >         tar -cf "$image_name-dir.tar" "$image_name"
>> >
>> >         # create a convenience symlink
>> > -       ln -sf "$image_name.tar" "${IMAGE_BASENAME}-${OCI_IMAGE_TAG}-o=
ci.tar"
>> > -       ln -sf "$image_name-dir.tar" "${IMAGE_BASENAME}-${OCI_IMAGE_TA=
G}-oci-dir.tar"
>> > +       ln -sf "$image_name.tar" "${IMAGE_BASENAME}-$image_tag-oci.tar=
"
>> > +       ln -sf "$image_name-dir.tar" "${IMAGE_BASENAME}-$image_tag-oci=
-dir.tar"
>> >      fi
>> >
>> >      # We could make this optional, since the bundle is directly runna=
ble via runc
>> >      rm -rf $image_bundle_name
>> >
>> >      # This is the OCI image directory, which is technically the "imag=
e" as specified
>> > -    ln -sf $image_name ${IMAGE_BASENAME}-${OCI_IMAGE_TAG}-oci
>> > +    ln -sf $image_name ${IMAGE_BASENAME}-$image_tag-oci
>> >  }
>> > --
>> > 2.34.1
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#8336): https://lists.yoctoproject.org/g/meta-virtu=
alization/message/8336
>> > Mute This Topic: https://lists.yoctoproject.org/mt/101758365/1050810
>> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsu=
b [bruce.ashfield@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

