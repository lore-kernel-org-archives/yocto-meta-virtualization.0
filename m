Return-Path: <aurelienbertron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0488C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:05:27 +0000 (UTC)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.web12.423.1654099522211183768
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Jun 2022 09:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IXLd8W6J;
 spf=pass (domain: gmail.com, ip: 209.85.221.178,
 mailfrom: aurelienbertron@gmail.com)
Received: by mail-vk1-f178.google.com with SMTP id bj33so651810vkb.12
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Jun 2022 09:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=lg//2rMzIEKqtu4qrzodkcBs26KZzjzSu7P+jtG72bU=;
        b=IXLd8W6J6mWcwd84+Lgl1Juyf9UQS3uaaYZ5YcEMYidlJlvjjr5z8adycbngcRYHqJ
         qwCwGy6QHa1lTkqSgYY/SKSIy3PqZeoc4BIDO8xy3/m5KX8w7C7m14aAvd2UbLVs9yl0
         RfyCQb7hrYy14/0S+sD3mPJLU61Nz6CxXSmt33NoVCMuLsnfbmOgnP9IGNrTzRN6ipHW
         rzNWTdx/X4nFHx4rKYTfgdWl9hrwm5/yqT9XpcUUpb6IteKE4DXEs/TUrSxsX81qG36d
         PbB20HbJvfwavTAfqkaUrgq+lylMCLNlkbQGmAcMQ3T2ryfjV3jL4PU6Xq+x4vUKCtjH
         UTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=lg//2rMzIEKqtu4qrzodkcBs26KZzjzSu7P+jtG72bU=;
        b=a6X/GbKaDCn/oN5XuyfYwchoC1dwL6IeVqkB6xtPtxgdClpscSlL5FCl/0MY+fw/7Y
         7L0RYphyEQPSR8xfJ9e5vj/xsNEwkR1pWfDvjyx1F0eGda9C/QkZvpVdY7W5Rr7NIvtO
         xkYxXhy54s4KW5Y010eOlIngCOKTuBWBntBZr/EyK4+KD++hvm7b22vu2A8P3GulLcMb
         NOo9mr7qgLTmvWiEZYxKhEZKiVjDnzkzUWjunmQRPzOWn7yWuVtqzC4GANxvR2+uHftU
         cFpSrP7Dp4MWeq1hrO0O5Pr+9ADOREirUhVOx5pEnJAra8+Jpu7DbtS6CzTDwEWH4RjZ
         nyXA==
X-Gm-Message-State: AOAM532OTnZJmyajGi4oziaRz9O/W5KUeffbgYtP2grE3GCaSqykd8ug
	pdANfdSXL+1Sw4nhCd9xAOQgN78iW3tqXW+e3gO5nQpU2i8=
X-Google-Smtp-Source: 
 ABdhPJxD3LaCeA9ZjuTCbRADN3eEl44BiR9ilIHZNcogg6IDy5djDvCoOhcut9goJeqYwKA1EJ1HJLwK/AuJSr+RJT4=
X-Received: by 2002:a05:6122:1786:b0:35c:4b61:831 with SMTP id
 o6-20020a056122178600b0035c4b610831mr8112248vkf.9.1654099521355; Wed, 01 Jun
 2022 09:05:21 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Aur=C3=A9lien_Bertron?= <aurelienbertron@gmail.com>
Date: Wed, 1 Jun 2022 18:05:10 +0200
Message-ID: 
 <CAKGXpebcjpJzWVZBYOm1sB3277A7ryOaid1UG5a9BkAig=P5OA@mail.gmail.com>
Subject: [podman-compose] references absent SRCREV
To: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Jun 2022 16:05:27 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7330

Hi all,

On kirkstone branch, the recipe podman-compose_1.0.3.bb specifies the
following variables :

SRC_URI =3D "git://github.com/containers/podman-compose.git;branch=3Ddevel;=
protocol=3Dhttps"
SRCREV =3D "1555417958dfce23f03eeb7c1e85caacac7469b3"

Problem: the commit 1555417958dfce23f03eeb7c1e85caacac7469b3 does not
exist on upstream repo, so the fetch step fails. Am I missing something?

Aur=C3=A9lien.

