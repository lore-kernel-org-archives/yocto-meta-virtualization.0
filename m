Return-Path: <maggu2810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4260EB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 11:37:49 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.37210.1688989065627389177
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 Jul 2023 04:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Zy9eATvl;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: maggu2810@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-992b66e5affso560102366b.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Jul 2023 04:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688989064; x=1691581064;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AwjlOR0qv02rJIML1knlM2LKeA/KzKqLT1lRnqaXvHM=;
        b=Zy9eATvlxrF4p0oODgw/vmHvSCa+XCCJnsHcdDv9QwlrMZngjyjVBacprYA7fqZRoi
         bCc/AAgCXnK82zJjqGcrUev7PGyteV0eIYho3wYK6Lh2HEjI3xNuH5r9CGhT+Zy5jCzN
         ANmgtw+VksLpH7llg18Motr/K8jH1O9M8uKZBFrzeZalLQpcGTnAxcghEFHIuwP5EpMh
         KFTyNmE4b5d/hMcOdMqs0+5YO/fKh+mdzLVa7WNiFNiQOieehHlyv5jzrtbwnNrBEjRg
         nVsO6WFFonl1p57iKai7fPdVothwk1AsPFdIWP6B0/C1H0IJ889hMgopRTVL5EGifZAY
         LtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688989064; x=1691581064;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AwjlOR0qv02rJIML1knlM2LKeA/KzKqLT1lRnqaXvHM=;
        b=SSf7vliSZksEuo0hSJk865QLy1d3cZ9Sp4haXsW4VGYpaKV1pNNnLUGCiiAnBZPJGE
         Y8+sl2GHlFZcQLCKh7RTVnR95vhhSof64JIKpRd38dbTRzfSHoVWazqRAZ8edFtnIrei
         12snU+WN6aO04Vs/4/xJ2AuwUvGxmBTD0OHi9MyS1Ag7UhJgn7tBsTjwlbIeVLnNBywJ
         YdpiUnmQ239M++VFuNkXhZIBH+AKcsPELInEKmEIhQkWCDg2CHGziXHYLxIkAi+XRo3T
         eXwTcTmYVHcGZ/yWgfiHZ+bFJ5eUBPGDd+cYUSePFFi/ekMHdE6gNnEJ+dvz2c1s842o
         nb9w==
X-Gm-Message-State: ABy/qLbY30TIa2O3/h4Aomb7y2L/2rKnp0HRx7Vt0IamihUb4F3q3BjR
	A9TxYPd2u0TunxNdFHvpxJztrwixvGYheBAKZb1/rpqziqQ=
X-Google-Smtp-Source: APBJJlEtqxEsUTXRUtPte+1SUVTQHW1tITAe3oLrOVsUnBqZn1u2mKwROXyAEeY/McC/Qb7tAMAYcRW2ijsv2Ozxxxo=
X-Received: by 2002:a17:906:728f:b0:993:dd1d:8258 with SMTP id
 b15-20020a170906728f00b00993dd1d8258mr8474018ejl.17.1688989063938; Mon, 10
 Jul 2023 04:37:43 -0700 (PDT)
MIME-Version: 1.0
From: Markus Rathgeb <maggu2810@gmail.com>
Date: Mon, 10 Jul 2023 13:37:33 +0200
Message-ID: <CAOcK=CMxS_n1kQcDTMO0DwXPVe=CcyfHDZqifOm9mjvO+X_KyA@mail.gmail.com>
Subject: [kirkstone] docker-compose: missing dependency
To: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000002f858206002069ac"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Jul 2023 11:37:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8124

--0000000000002f858206002069ac
Content-Type: text/plain; charset="UTF-8"

Hello,
I am using your layer in a custom distribution.
I am using the kirkstone branch.

I added python3-docker-compose to my image.
The following recipe is used:
meta-virtualization/recipes-containers/docker-compose/
python3-docker-compose_1.29.2.bb

If I use the docker-compose command on my target machine the following
error is shown:

# docker-compose
Traceback (most recent call last):
  File "/usr/bin/docker-compose", line 5, in <module>
    from compose.cli.main import main
  File "/usr/lib/python3.10/site-packages/compose/cli/main.py", line 9, in
<module>
    from distutils.spawn import find_executable
ModuleNotFoundError: No module named 'distutils'

After adding "python3-distutils" to my image explicit the error is gone.

I assume the recipe "python3-docker-compose_1.29.2.bb" misses a RDEPEND for
"python3-distutils".

Best regards,
Markus

--0000000000002f858206002069ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div>I am using your layer in a custom di=
stribution.</div><div>I am using the kirkstone branch.</div><div><br></div>=
<div>I added python3-docker-compose to my image.</div><div>The following re=
cipe is used: meta-virtualization/recipes-containers/docker-compose/<a href=
=3D"http://python3-docker-compose_1.29.2.bb" target=3D"_blank">python3-dock=
er-compose_1.29.2.bb</a></div><div><br></div><div>If I use the docker-compo=
se command on my target machine the following error is shown:</div><div><br=
></div><div># docker-compose<br>Traceback (most recent call last):<br>=C2=
=A0 File &quot;/usr/bin/docker-compose&quot;, line 5, in &lt;module&gt;<br>=
=C2=A0 =C2=A0 from compose.cli.main import main<br>=C2=A0 File &quot;/usr/l=
ib/python3.10/site-packages/compose/cli/main.py&quot;, line 9, in &lt;modul=
e&gt;<br>=C2=A0 =C2=A0 from distutils.spawn import find_executable<br>Modul=
eNotFoundError: No module named &#39;distutils&#39;</div><div><br></div><di=
v>After adding &quot;python3-distutils&quot; to my image explicit the error=
 is gone.</div><div><br></div><div>I assume the recipe &quot;<a href=3D"htt=
p://python3-docker-compose_1.29.2.bb" target=3D"_blank">python3-docker-comp=
ose_1.29.2.bb</a>&quot; misses a RDEPEND for &quot;python3-distutils&quot;.=
</div><div><br></div><div>Best regards,</div><div>Markus</div></div>

--0000000000002f858206002069ac--

