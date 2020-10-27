Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.11208.1603790181731925263
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Oct 2020 02:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@optimcloud.com header.s=obsd header.b=S6kstApM;
 spf=none, err=SPF record not found (domain: optimcloud.com, ip: 198.145.29.25, mailfrom: yocto@optimcloud.com)
Received: from mx02.optimcloud.com (mx02.optimcloud.com [46.23.93.22])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 765B138C089D
	for <meta-virtualization@yoctoproject.org>; Tue, 27 Oct 2020 02:16:20 -0700 (PDT)
Received: from mx02.optimcloud.com (localhost [127.0.0.1])
	by mx02.optimcloud.com (OpenSMTPD) with ESMTP id 166be565
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Oct 2020 10:16:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=optimcloud.com; h=to
	:from:subject:message-id:date:mime-version:content-type; s=obsd;
	 bh=Dr7IdKTzd71T0s2Hl8Y8Y8kKiYu9Jm5QTKbWukMv9qQ=; b=S6kstApMJObz
	L9qRMic35xhMCpXZRJRXdEoBzdHx78b6FGwaDzQdSMR6WF33BcCE1PkwEgAdy4Eu
	HlIoYa6s9n7aDlwDip692/dTMhbaKv392CHfI3ql3SGkZhOU0n4gEv2yq2HSrZHE
	SZCoTNszQcIYfwPtGb/rrnY1H71QCcvKQnkQLdjVVHYxUljFQxXnNLZ1glP5AzPT
	6H/ZPyb342SJo5sTnsGgHPHGgn7vPGOa7vbSLlKPpE37JK7WLBmOQveybXkOPkFA
	bnG1yc7GMgmrCpJZTbhfNPgEULVuKFET2lo9eclZK3XVAqRP9SLBhXpGJf/Oj2Ah
	bL60RF6D4A==
DomainKey-Signature: a=rsa-sha1; c=nofws; d=optimcloud.com; h=to:from
	:subject:message-id:date:mime-version:content-type; q=dns; s=
	obsd; b=EAv6lVhBK0UGKp48lkT31lu2/ludtvlsOxoDIoMUTdM6beJX+N0LLz9H
	WuQTQ6d3MZdTVwMIVmigb4rC41ZQK96cltdsDPSuUWfNG1OaB6P0rzHZBzrS9ZID
	N7USM4Xh61Wm8PoIsFZZY/kynMbOjRkALOZ29ieiWDGrZsGJZ8xQmYAeVfX9Skmd
	ClRTRH+QcjjJ0XqcM0o3KRS47o2Z9VsUDZjrceuheRwQL9e1EMqCH/Pk16EeJAZd
	BR4OYN/utj0LTSxNM/JkCzZUb8klXiX1qat2A91GsqLANzKku0ZN0zdgmAGhrDHf
	S2FPdbG34XkhhOKtueki5BjCatmNHw==
Received: 
	by mx02.optimcloud.com (OpenSMTPD) with ESMTPSA id 05411fc7 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO) auth=yes user=yocto@optimcloud.com
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Oct 2020 10:16:16 +0100 (CET)
To: "meta-virtualization@yoctoproject.org"
 <meta-virtualization@yoctoproject.org>
From: "Yocto" <yocto@optimcloud.com>
Subject: is meta-cloud-services/meta-openstack useable, or a WIP ?
Message-ID: <b2b268d8-8c1a-2424-2029-7238e52404f8@optimcloud.com>
Date: Tue, 27 Oct 2020 16:16:12 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------1C9C42D53E589F367468801E"
Content-Language: en-US

--------------1C9C42D53E589F367468801E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

|okay reading the doc README it states There are six openstack layers 
that are used to build a controller/compute node image pair. The 
dependencies of these layers are also required for a build, and are 
listed in the layers themselves. - meta-cloud-services/meta-openstack - 
meta-cloud-services/meta-openstack-compute-deploy - 
meta-cloud-services/meta-openstack-controller-deploy - 
meta-cloud-services/meta-openstack-qemu - 
meta-cloud-services/meta-openstack-compute-test-config - 
meta-cloud-services/meta-openstack-controller-test-config so the 
question is, is this actually usable to bitbake openstack based images ? 
or a Work in progress ? |


--------------1C9C42D53E589F367468801E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre><code>okay reading the doc README it states

There are six openstack layers that are used to build a controller/compute
node image pair. The dependencies of these layers are also required for a
build, and are listed in the layers themselves.

   - meta-cloud-services/meta-openstack
   - meta-cloud-services/meta-openstack-compute-deploy
   - meta-cloud-services/meta-openstack-controller-deploy
   - meta-cloud-services/meta-openstack-qemu
   - meta-cloud-services/meta-openstack-compute-test-config
   - meta-cloud-services/meta-openstack-controller-test-config

so the question is, is this actually usable to bitbake openstack based images ? or a Work in progress ?
</code></pre>
  </body>
</html>

--------------1C9C42D53E589F367468801E--
