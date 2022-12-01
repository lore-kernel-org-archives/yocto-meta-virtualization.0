Return-Path: <joakim.roubert@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F15DC43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 13:46:22 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.43655.1669902377991348391
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Dec 2022 05:46:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=oxWC95rR;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: joakim.roubert@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1669902378;
  x=1701438378;
  h=message-id:date:mime-version:from:to:subject:
   content-transfer-encoding;
  bh=6apPqgOcUB9jtjv19Sm209hJ2tBEkFA41MwgrMY1M/I=;
  b=oxWC95rRr7dfNqHsLO0yGsSaBWfBSzN2U7mi8MPJMY5/+PtDVlG/uVKw
   7OxagZAZtwjmNH2VgFdxMUbBiEvFw+4+G7dmyvXC7kD/ERKWxV/b1qRLR
   eey00AUPa4n+mj0+Me8CDcHEtoFZbviAjhJfN0R8GsbasDTzLcZUNCO9w
   qc+qMtHAp8U2yelfMu4jgmhBc+J+nVBe5A2CpSzCmV9ROFSwy0YMCegt6
   seKJds7e3EFI2vcPaionBCvGUhp6rZIGEwEiqMgqXK4iq5kHNA5Ufb0SR
   /sioOC/pdt4HwoUjrDM6kS99NNti62amffe6XuU9hqX5BFe/uZj50VmPM
   g==;
Message-ID: <ddf7cf66-0067-2ea9-dbad-a73bba79a5db@axis.com>
Date: Thu, 1 Dec 2022 14:46:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
From: Joakim Roubert <joakim.roubert@axis.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: [Question] upx: do_fetch: Bitbake Fetcher
 Error:,FetchError('Submodule refers to the parent repository.
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail06w.axis.com (10.20.40.12) To se-mail07w.axis.com
 (10.20.40.13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Dec 2022 13:46:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7720

Hi!

On Kirkstone, since Kirkstone 4.0.5 (commit 
189a6d452e3037c9e94ccdf6af38359fc6058064, 
https://git.yoctoproject.org/poky/commit/?h=kirkstone&id=189a6d452e3037c9e94ccdf6af38359fc6058064) 
the added check gives me

ERROR: upx-3.96+AUTOINC+4e1ae22a1a-r0 do_fetch: Bitbake Fetcher Error:
FetchError('Submodule refers to the parent repository. This will cause
deadlock situation in current version of Bitbake.Consider using git
fetcher instead.', None)

(I noticed that latest master is identical with latest kirkstone.)
I'm experimenting with using git:// instead of gitsm:// and adding a 
suggested solution if found searching for documentation on how to 
migitate this

do_configure:prepend() {
     cd ${WORKDIR}/git
     git submodule update --init --recursive
}

but I've not yet been able to make things work. Since I'm no power user 
when it comes to Yocto magic perhaps someone already knows what would be 
the best way forward on this (if I'm on the wrong path)?

BR,

/Joakim


