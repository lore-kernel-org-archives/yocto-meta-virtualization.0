Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6988DCDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 18:35:52 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.135246.1697481351176580555
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 11:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I77r/MMy;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-507962561adso5210541e87.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Oct 2023 11:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697481349; x=1698086149; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X24bkxZJCYscpCT2t0VCmtQIVGyw+A4y0s35R5eZoI0=;
        b=I77r/MMybGkw3U1IW8VMPzUKxWzJqWiYQfmNVWqa4VBpWhw/aVdRt31KtQQLXlTuDO
         eaJ6IiGj4ceJJ0XG1WZVs8QUK2Lcw94TF3d+LcYS82gPz8H2pEzBPZXNEbXAkhxuSWzv
         h8kQ1ZIWV98RE9F1+yatodsn/+tpSaNCbqFpxsBb7y+Lm6DA+gmaZsW5pCyRvn3rS8+z
         HbBUde6gmG1O14zrIDlwlJEeFflNqHc5olfJU5dWaillk0Jb34poFx7ybO3I6+vc+RL3
         Nn0XQcQ6Ai8MLRUZRzP+46anTh7BI3eEuIGPcM6uPK24uEmoqjj6PCHXb9dluDg8yFzS
         kIGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697481349; x=1698086149;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X24bkxZJCYscpCT2t0VCmtQIVGyw+A4y0s35R5eZoI0=;
        b=WRoKvvAgx9Cvf1CO9IUNNg7i5D1rt4TYDfXmOHZHkNAcB0eEFR0nlgrl16gTzS0Nso
         Lzua+GKG/DYh4OfKo+gsNVn1vNDzBaqTkQT+ZLPPL1qWBbsqlb6OHlxrkMADnRGuhtO8
         Pey9VLF/NwvAqpf58WzGtyOqN9/R5kVP2l5u2wgLEomOZpSv8CBnVhJXzACspfJgvb+M
         +8DZogxRytseOFrtYf/2BRcbbYnpbR9oo7mFKZIVblscfeC86bUReL6frMjhFqqO3EIb
         t4J+0/riykWLEegsRaeYQR4LvLR9wWkmxfNK5nDbjQHgrPugHF1nJmHAJ5vOgDXelZ80
         FzkA==
X-Gm-Message-State: AOJu0Yzcc9ndFSYxi+wpF8q2ITj1xaH53vntCTOiM0dKv6k6FEF7rzrc
	iznwKFr4EJfQ9vikWomOn6WNY2lz3680lnvgKuw=
X-Google-Smtp-Source: AGHT+IHmVkLNHhyNt8WbyBVqObE84+6cksPsvXbhnurmDGN4dcmHh6eQ+UOJyUAqSecnwZ7FUbE2GHqLiHnEZhQxe0Q=
X-Received: by 2002:a19:2d49:0:b0:4fb:8f79:631 with SMTP id
 t9-20020a192d49000000b004fb8f790631mr92842lft.46.1697481348967; Mon, 16 Oct
 2023 11:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20231004160212.3574826-1-JPEWhacker@gmail.com> <CADkTA4PN1AHnObAX+p+rR0fCH+yj+q6O9SArs22-XZQpzfEU0Q@mail.gmail.com>
In-Reply-To: <CADkTA4PN1AHnObAX+p+rR0fCH+yj+q6O9SArs22-XZQpzfEU0Q@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 16 Oct 2023 12:35:37 -0600
Message-ID: <CAJdd5GZi3=XLOAJ0o1jOyq_-+MkwLqFp137_vy5wf0S4QBRLZA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] classes/image-oci-umoci: Replace ":"
 in image file name
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000d172f00607d9ac0f"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Oct 2023 18:35:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8373

--000000000000d172f00607d9ac0f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2023, 12:06=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmail=
.com>
wrote:

> On Wed, Oct 4, 2023 at 12:02=E2=80=AFPM Joshua Watt <JPEWhacker@gmail.com=
> wrote:
> >
> > The OCI_IMAGE_TAG variable can contain a ":" if the user wants to give
> > the image a name and a tag, as in:
> >
> >     OCI_IMAGE_TAG =3D "${IMAGE_BASENAME}:latest"
> >
> > However, while this is valid for tag name, the ":" is illegal in OCI
> > image file names so replace it with "_" when naming the symlinks
>
> I haven't experimented with this yet, but as I mentioned on IRC
> some time ago, we really don't want to change the symlinks
> unless absolutely possible.
>
> I'm still trying to understand the first RFC patch before getting into
> the question of the symlink.
>
> But my question on this is ... who / what is declaring it illegal to
> have a : on the symlink name ? Is one of the OE/bitbake
> components ? umoci ? podman ? something else ?
>

Skopeo and podman both have this restriction. They allow specifying a tag
inside an image with a :tag suffix, so you can't have an OCI file/directory
named "foo:latest" because they assume that means a file/directory named
"foo" and the tag "latest" inside it.


> Bruce
>
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  classes/image-oci-umoci.inc | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
> > index 58e4668..adca6c1 100644
> > --- a/classes/image-oci-umoci.inc
> > +++ b/classes/image-oci-umoci.inc
> > @@ -105,6 +105,10 @@ IMAGE_CMD:oci() {
> >      fi
> >      umoci config --image $image_name:${OCI_IMAGE_TAG} --author
> ${OCI_IMAGE_AUTHOR_EMAIL}
> >
> > +    # OCI_IMAGE_TAG may contain ":", but these are not allowed in OCI
> file
> > +    # names so replace them
> > +    image_tag=3D"${@d.getVar("OCI_IMAGE_TAG").replace(":", "_")}"
> > +
> >      # make a tar version of the image direcotry
> >      #  1) image_name.tar: compatible with oci tar format, blobs and
> rootfs
> >      #     are at the top level. Can load directly from something like
> podman
> > @@ -118,13 +122,13 @@ IMAGE_CMD:oci() {
> >         tar -cf "$image_name-dir.tar" "$image_name"
> >
> >         # create a convenience symlink
> > -       ln -sf "$image_name.tar"
> "${IMAGE_BASENAME}-${OCI_IMAGE_TAG}-oci.tar"
> > -       ln -sf "$image_name-dir.tar"
> "${IMAGE_BASENAME}-${OCI_IMAGE_TAG}-oci-dir.tar"
> > +       ln -sf "$image_name.tar" "${IMAGE_BASENAME}-$image_tag-oci.tar"
> > +       ln -sf "$image_name-dir.tar"
> "${IMAGE_BASENAME}-$image_tag-oci-dir.tar"
> >      fi
> >
> >      # We could make this optional, since the bundle is directly
> runnable via runc
> >      rm -rf $image_bundle_name
> >
> >      # This is the OCI image directory, which is technically the "image=
"
> as specified
> > -    ln -sf $image_name ${IMAGE_BASENAME}-${OCI_IMAGE_TAG}-oci
> > +    ln -sf $image_name ${IMAGE_BASENAME}-$image_tag-oci
> >  }
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8336):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8336
> > Mute This Topic: https://lists.yoctoproject.org/mt/101758365/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--000000000000d172f00607d9ac0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto"><div><br><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 16, 2023, 12:06=E2=80=AFP=
M Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"=
_blank">bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On Wed, Oct 4, 2023 at 12:02=E2=80=AFPM Joshua Watt &lt;<a hr=
ef=3D"mailto:JPEWhacker@gmail.com" rel=3D"noreferrer" target=3D"_blank">JPE=
Whacker@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The OCI_IMAGE_TAG variable can contain a &quot;:&quot; if the user wan=
ts to give<br>
&gt; the image a name and a tag, as in:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0OCI_IMAGE_TAG =3D &quot;${IMAGE_BASENAME}:latest&qu=
ot;<br>
&gt;<br>
&gt; However, while this is valid for tag name, the &quot;:&quot; is illega=
l in OCI<br>
&gt; image file names so replace it with &quot;_&quot; when naming the syml=
inks<br>
<br>
I haven&#39;t experimented with this yet, but as I mentioned on IRC<br>
some time ago, we really don&#39;t want to change the symlinks<br>
unless absolutely possible.<br>
<br>
I&#39;m still trying to understand the first RFC patch before getting into<=
br>
the question of the symlink.<br>
<br>
But my question on this is ... who / what is declaring it illegal to<br>
have a : on the symlink name ? Is one of the OE/bitbake<br>
components ? umoci ? podman ? something else ?<br></blockquote></div></div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Skopeo and podman both have t=
his restriction. They allow specifying a tag inside an image with a :tag su=
ffix, so you can&#39;t have an OCI file/directory named &quot;foo:latest&qu=
ot; because they assume that means a file/directory named &quot;foo&quot; a=
nd the tag &quot;latest&quot; inside it.<br></div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
<br>
Bruce<br>
<br>
&gt;<br>
&gt; Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com"=
 rel=3D"noreferrer" target=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 classes/image-oci-umoci.inc | 10 +++++++---<br>
&gt;=C2=A0 1 file changed, 7 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc=
<br>
&gt; index 58e4668..adca6c1 100644<br>
&gt; --- a/classes/image-oci-umoci.inc<br>
&gt; +++ b/classes/image-oci-umoci.inc<br>
&gt; @@ -105,6 +105,10 @@ IMAGE_CMD:oci() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 umoci config --image $image_name:${OCI_IMAGE_TAG} =
--author ${OCI_IMAGE_AUTHOR_EMAIL}<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 # OCI_IMAGE_TAG may contain &quot;:&quot;, but these ar=
e not allowed in OCI file<br>
&gt; +=C2=A0 =C2=A0 # names so replace them<br>
&gt; +=C2=A0 =C2=A0 image_tag=3D&quot;${@d.getVar(&quot;OCI_IMAGE_TAG&quot;=
).replace(&quot;:&quot;, &quot;_&quot;)}&quot;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # make a tar version of the image direcotry<br>
&gt;=C2=A0 =C2=A0 =C2=A0 #=C2=A0 1) image_name.tar: compatible with oci tar=
 format, blobs and rootfs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0are at the top level. Can loa=
d directly from something like podman<br>
&gt; @@ -118,13 +122,13 @@ IMAGE_CMD:oci() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tar -cf &quot;$image_name-dir.tar&quo=
t; &quot;$image_name&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# create a convenience symlink<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf &quot;$image_name.tar&quot; &quot;$=
{IMAGE_BASENAME}-${OCI_IMAGE_TAG}-oci.tar&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf &quot;$image_name-dir.tar&quot; &qu=
ot;${IMAGE_BASENAME}-${OCI_IMAGE_TAG}-oci-dir.tar&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf &quot;$image_name.tar&quot; &quot;$=
{IMAGE_BASENAME}-$image_tag-oci.tar&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf &quot;$image_name-dir.tar&quot; &qu=
ot;${IMAGE_BASENAME}-$image_tag-oci-dir.tar&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # We could make this optional, since the bundle is=
 directly runnable via runc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rm -rf $image_bundle_name<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # This is the OCI image directory, which is techni=
cally the &quot;image&quot; as specified<br>
&gt; -=C2=A0 =C2=A0 ln -sf $image_name ${IMAGE_BASENAME}-${OCI_IMAGE_TAG}-o=
ci<br>
&gt; +=C2=A0 =C2=A0 ln -sf $image_name ${IMAGE_BASENAME}-$image_tag-oci<br>
&gt;=C2=A0 }<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#8336): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/8336" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://lists.yoctoproject.org/g/meta-virtualization/message/8336</=
a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/10175836=
5/1050810" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yo=
ctoproject.org/mt/101758365/1050810</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" rel=3D"noreferrer" target=3D"_blank">meta-virtualization+owner=
@lists.yoctoproject.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists=
.yoctoproject.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.=
ashfield@gmail.com" rel=3D"noreferrer" target=3D"_blank">bruce.ashfield@gma=
il.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div></div></div>
</div>

--000000000000d172f00607d9ac0f--

