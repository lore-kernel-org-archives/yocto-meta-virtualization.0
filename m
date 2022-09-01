Return-Path: <morgan@softbaugh.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B446ECAAD3
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 15:28:18 +0000 (UTC)
Received: from bee.birch.relay.mailchannels.net
 (bee.birch.relay.mailchannels.net [23.83.209.14])
 by mx.groups.io with SMTP id smtpd.web12.13628.1662046076584055424
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Sep 2022 08:28:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@softbaugh.com
 header.s=dreamhost header.b=qac+3b2/;
 spf=pass (domain: softbaugh.com, ip: 23.83.209.14,
 mailfrom: morgan@softbaugh.com)
X-Sender-Id: dreamhost|x-authsender|morgan@softbaugh.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 961C0430E0
	for <meta-virtualization@lists.yoctoproject.org>;
 Thu,  1 Sep 2022 15:27:43 +0000 (UTC)
Received: from pdx1-sub0-mail-a232 (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 23F4843493
	for <meta-virtualization@lists.yoctoproject.org>;
 Thu,  1 Sep 2022 15:27:43 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1662046063; a=rsa-sha256;
	cv=none;
	b=wyQGH1ct5AuMkQ3lVF61UfKAYEQW8HhU9XuXDOnxYztATQFjb7EqkFXCwaVLNH7M4S8KZJ
	W6fi5GBZN3TlGGTqOvGMPlNMqH94gqIwZebmG2vVb0M2EWXemPekGfvRDfPZdlB27iiJh3
	U/uYVu9w2NiH3RTbqcssthlMm40a93xsatXgKD02csoYmIGdNihXRlwpWlsFPIq6qFPm6Z
	qdYXiyQBQN5GX1o96DZIqsPvrkA/93SEyYNyEcGjDm7a7dCxyOAOHrSTh4YLsxVbQAb3df
	oYLP7/7kTK958Npm8tP3ZLZvjTORPyVe4qNuQfFmtkef/WvYaU3v9jd5xq+mCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1662046063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 dkim-signature; bh=tEJBius0vNDnwBc5PuKLbMFsOQd2rKt5jBx/Ky7H8tI=;
	b=49OdZ7Rb2qLCZ61b0IKGlSJ31zOJYaQad1ePtJH2NWoI5T6ArSQknixWCBZLzppnnbJJZA
	4S5zAoHCC/LLhIpxJddF777o47bKHZItHqFDbcNPLq/gs1oaVOvYO/WHV1IjMc5HhCY90b
	TqlT988gBw2be3oW4J0dfbhXlo0FiiqiX3qGK9zEK8G1Sc2/6Gi/SS3dbDfC3vfCigdtoA
	xkwfIznQ+YInsOCKSHeH6jFfRo7+3qvJMgn0h+YlremCPenL1fcyhx+JD2cpGlhhCgHSEP
	gzur929LF4FVPcISJMlyHK0t3HokGF9+wHTm4oIzyrCwxHs1/e9XVq9hHgJaWQ==
ARC-Authentication-Results: i=1;
	rspamd-75b4464bd-zghmx;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=morgan@softbaugh.com
X-Sender-Id: dreamhost|x-authsender|morgan@softbaugh.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|morgan@softbaugh.com
X-MailChannels-Auth-Id: dreamhost
X-Illegal-Attack: 01c3724d2697151a_1662046063416_306421136
X-MC-Loop-Signature: 1662046063416:2045621215
X-MC-Ingress-Time: 1662046063416
Received: from pdx1-sub0-mail-a232 (pop.dreamhost.com [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.119.76.153 (trex/6.7.1);
	Thu, 01 Sep 2022 15:27:43 +0000
Received: from [192.168.1.140] (unknown [172.76.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: morgan@softbaugh.com)
	by pdx1-sub0-mail-a232 (Postfix) with ESMTPSA id 4MJQ0G3vvSz1b
	for <meta-virtualization@lists.yoctoproject.org>;
 Thu,  1 Sep 2022 08:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=softbaugh.com;
	s=dreamhost; t=1662046062;
	bh=tEJBius0vNDnwBc5PuKLbMFsOQd2rKt5jBx/Ky7H8tI=;
	h=Content-Type:Date:From:Subject:To;
	b=qac+3b2/+93jmqydM9399COpWw7AxlXXy06nzgfqH4YC66EzITCnBrJ8NdCpbRNlr
	 p/X26yDdPzFcxda3xlxj9bUMv3pcudZcBL6ovAwZSjmFuROya260VhHjmRtyX6FyPx
	 08oJreKdlRQD/7uKC+f6J0BDuZFCRr+uLlj5gYV9EKLGZJEiqFU9s3m2EOmCJjY3be
	 hCuOsKztC4CKfgkhvXjndJ2DtexHWamjN+R8emscl/PaZtUpGKP5s6l7iQxhCc6UUq
	 9k6kpRfcrbTLYKHcVwLVSY3bOAbNojTE9rr94yofms/0pY+9IhjSBZTcAPbsDWNj3M
	 uc85/k05ZGIcA==
Content-Type: multipart/alternative;
 boundary="------------ybBZ0HCB2bMUdDB9ssEym722"
Message-ID: <edbd294d-86be-b302-387c-222753d8837a@softbaugh.com>
Date: Thu, 1 Sep 2022 10:27:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Morgan Baugh <morgan@softbaugh.com>
Subject: Docker network bridge not working on Yocto Hardknott
To: meta-virtualization@lists.yoctoproject.org
Content-Language: en-US
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Sep 2022 15:28:18 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7590

This is a multi-part message in MIME format.
--------------ybBZ0HCB2bMUdDB9ssEym722
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi All,

I have built a Yocto Hardknott image for the i.MX8 according to the=20
following Variscite tutorial: Yocto Build Release | Variscite Wiki=20
<https://variwiki.com/index.php?title=3DYocto_Build_Release&release=3Dmx8=
-yocto-hardknott-5.10.72_2.2.1-v1.1>

Then, I added Docker by setting the following in local.conf:
IMAGE_INSTALL_append =3D " docker"
DISTRO_FEATURES_append =3D " virtualization"

The image builds fine, boots, and runs Docker (which takes a few minutes=20
to start), however, the containers fail to connect to the docker0=20
bridge. For example, an Nginx container will not emit the expected=20
boilerplate HTML via curl:

root@imx8qm-var-som:~# docker run -p 80:80 -d nginx
root@imx8qm-var-som:~# curl localhost
root@imx8qm-var-som:~# curl: (56) Recv failure: Connection reset by peer

This problem can be temporarily overcome by brctl:

root@imx8qm-var-som:~# brctl addif docker0 $(ifconfig | grep veth | cut=20
-c 1-11)
root@imx8qm-var-som:~# curl localhost
html stuff that won=E2=80=99t render properly on the forum=E2=80=A6

Specifically, Docker is not adding the veth interface to the docker0=20
bridge upon container creation/restart. I have tried modifying the Yocto=20
build to replace NetworkManager with connman or nothing at all, but this=20
doesn=E2=80=99t make a difference. In fact, when NetworkManager is runnin=
g,=20
=E2=80=9Cnmcli device status=E2=80=9D shows docker0 as =E2=80=9Cconnected=
 (externally)=E2=80=9D, which,=20
to my knowledge, means that something other than NetworkManager is=20
responsible for it.

I have repeated the test on a Dunfell version of the Variscite Yocto=20
build, as well as a non-Variscite build of Yocto Hardknott for the=20
Raspberry Pi 4, and Docker=E2=80=99s network bridge functions properly in=
 both=20
cases. However, swapping the meta-virtualization layer (which contains=20
Docker itself among other things), meta-openembedded, or the Linux=20
kernel from these into the Variscite Hardknott build doesn=E2=80=99t solv=
e the=20
problem. I had once considered the possibility that containerd was at=20
fault, however, that is part of meta-virtualization, and would have been=20
fixed by swapping that layer if it was the problem.

To recap, the problem appears to be specific to Variscite + Yocto=20
Hardknott + Docker, and consists of a failure to automatically add the=20
veth to docker0. Running the container with host networking does work,=20
but is not suitable for my application. Any help would be greatly=20
appreciated!

--------------ybBZ0HCB2bMUdDB9ssEym722
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <div class=3D"cooked">
      <p>Hi All,</p>
      <p>I have built a Yocto Hardknott image for the i.MX8 according to
        the following Variscite tutorial: <a
href=3D"https://variwiki.com/index.php?title=3DYocto_Build_Release&amp;re=
lease=3Dmx8-yocto-hardknott-5.10.72_2.2.1-v1.1"
          class=3D"inline-onebox" rel=3D"noopener nofollow ugc"
          moz-do-not-send=3D"true">Yocto Build Release | Variscite Wiki</=
a></p>
      <p>Then, I added Docker by setting the following in local.conf:<br>
        IMAGE_INSTALL_append =3D " docker"<br>
        DISTRO_FEATURES_append =3D " virtualization"</p>
      <p>The image builds fine, boots, and runs Docker (which takes a
        few minutes to start), however, the containers fail to connect
        to the docker0 bridge. For example, an Nginx container will not
        emit the expected boilerplate HTML via curl:</p>
      <p>root@imx8qm-var-som:~# docker run -p 80:80 -d nginx<br>
        root@imx8qm-var-som:~# curl localhost<br>
        root@imx8qm-var-som:~# curl: (56) Recv failure: Connection reset
        by peer</p>
      <p>This problem can be temporarily overcome by brctl:</p>
      <p>root@imx8qm-var-som:~# brctl addif docker0 $(ifconfig | grep
        veth | cut -c 1-11)<br>
        root@imx8qm-var-som:~# curl localhost<br>
        html stuff that won=E2=80=99t render properly on the forum=E2=80=A6=
</p>
      <p>Specifically, Docker is not adding the veth interface to the
        docker0 bridge upon container creation/restart. I have tried
        modifying the Yocto build to replace NetworkManager with connman
        or nothing at all, but this doesn=E2=80=99t make a difference. In=
 fact,
        when NetworkManager is running, =E2=80=9Cnmcli device status=E2=80=
=9D shows
        docker0 as =E2=80=9Cconnected (externally)=E2=80=9D, which, to my=
 knowledge,
        means that something other than NetworkManager is responsible
        for it.</p>
      <p>I have repeated the test on a Dunfell version of the Variscite
        Yocto build, as well as a non-Variscite build of Yocto Hardknott
        for the Raspberry Pi 4, and Docker=E2=80=99s network bridge funct=
ions
        properly in both cases. However, swapping the
        meta-virtualization layer (which contains Docker itself among
        other things), meta-openembedded, or the Linux kernel from these
        into the Variscite Hardknott build doesn=E2=80=99t solve the prob=
lem. I
        had once considered the possibility that containerd was at
        fault, however, that is part of meta-virtualization, and would
        have been fixed by swapping that layer if it was the problem.</p>
      <p>To recap, the problem appears to be specific to Variscite +
        Yocto Hardknott + Docker, and consists of a failure to
        automatically add the veth to docker0. Running the container
        with host networking does work, but is not suitable for my
        application. Any help would be greatly appreciated!</p>
    </div>
  </body>
</html>

--------------ybBZ0HCB2bMUdDB9ssEym722--

