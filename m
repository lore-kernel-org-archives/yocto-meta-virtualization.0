Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95368C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 18:29:00 +0000 (UTC)
Received: from mailrelay1-2.pub.mailoutpod1-cph3.one.com
 (mailrelay1-2.pub.mailoutpod1-cph3.one.com [46.30.212.0])
 by mx.groups.io with SMTP id smtpd.web11.30551.1644431337666648888
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 09 Feb 2022 10:28:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa2 header.b=KgPL8s3L;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.0,
 mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa2;
	h=content-transfer-encoding:content-type:subject:from:to:mime-version:date:
	 message-id:from;
	bh=eH3Xi9Jt2sIRqn3K2vXaa3Y7KtjewlNcDWY3X0pIP8s=;
	b=KgPL8s3Lvs8QKmCkGv67vss9RYEMKWEUNgkVaFcEM1KbljMDm+Ba8LjwKSJdN4hEpVEBvEnwvjjRi
	 4GADSeBPoogc09CaAf5JECqx0HRyKJr2w9Wu8A1pYutfThn+dnhWwt3cknxmN2Qc9rkFXo/w0XycqD
	 GPGkhYlGKYjwDbRAYfGtJJvYhJ72WcUFIDjacNF9emK4myqFMM+KBgdwj9XmWrO4Uwnd2JIRpHipyd
	 QOgd0cx851s3qHC2EeA3v1nypqGeMqWCsgD63xenOkizDdfWUoLJkVaym5OfBAMZkWxMUfhwgYFBpr
	 nW0K/4Dl3SjIO0Ib5AjPc51IQ4nSazw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed2;
	h=content-transfer-encoding:content-type:subject:from:to:mime-version:date:
	 message-id:from;
	bh=eH3Xi9Jt2sIRqn3K2vXaa3Y7KtjewlNcDWY3X0pIP8s=;
	b=Ifuqfgx+1z/6ZioFZ6Qw3+XP99bX77mXpvnivkgarriQyBdYn+m6Uz1YlfwgOFLLdKvLl5RAube/d
	 3ueV5vXDg==
X-HalOne-Cookie: 35a8107661147221a641f8035e452cb9e6fecc8e
X-HalOne-ID: 22e6ef1b-89d6-11ec-881f-d0431ea8a283
Received: from [192.168.100.181] (ua-213-113-157-96.bbcust.telenor.se
 [213.113.157.96])
	by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 22e6ef1b-89d6-11ec-881f-d0431ea8a283;
	Wed, 09 Feb 2022 18:28:54 +0000 (UTC)
Message-ID: <ce2da674-576d-a0b1-d2ab-cd872b7b17aa@berginkonsult.se>
Date: Wed, 9 Feb 2022 19:28:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: meta-virtualization@lists.yoctoproject.org
From: Peter Bergin <peter@berginkonsult.se>
Subject: OCI images in yocto image
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 09 Feb 2022 18:29:00 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7056

Hi,

I'm exploring the world of containers combined with Yocto. I can build a 
container image and bundle that one with my rootfs image. The container 
image is stored in the rootfs as a tar-file of a OCI image spec with the 
content blobs, index.json and oci-layout. As per the description in 
classes/image-oci.bbclass the way to run the container is to unpack the 
file and the create the OCI runtime bundle and start it with runc.

I have played around with docker and tried to import OCI image directly 
in to docker store but have not succeeded. Anyone that knows if it is 
possible? 'docker image import <oci-image>.tar does not give any errors 
and the image shows up in 'docker images' but does not import the 
correct rootfs.

When creating the OCI image in image-oci.bbclass the process starts with 
a bundle that is packaged as an image and compressed to a tar-file. 
Given the above the whole process needs to be reverted on target to 
start a container from that image. It should then be possible to just 
install the bundle directly on target rootfs that directly can be 
started with runc. Are there any drawbacks with this? I can see that a 
tar-file is easier to distribute and install afterwards but my question 
related to directly integrating an OCI-image to a Yocto rootfs-image.

Best regards,

/Peter


