Return-Path: <yocto@optimcloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B14EC00140
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 14:21:42 +0000 (UTC)
Received: from mail.optimcloud.com (mail.optimcloud.com [46.23.82.133])
 by mx.groups.io with SMTP id smtpd.web10.42291.1660832492245228464
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 18 Aug 2022 07:21:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: optimcloud.com, ip: 46.23.82.133,
 mailfrom: yocto@optimcloud.com)
Content-Type: text/plain; charset=utf-8; format=flowed
Message-Id: <1660832328348.855190997.541685165@optimcloud.com>
From: Embedded Devel <yocto@optimcloud.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, "Bach, Pascal"
 <pascal.bach@siemens.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] netavark: init at 1.1.0
Date: Thu, 18 Aug 2022 14:21:22 +0000
In-Reply-To: 
 <CADkTA4Nt767FgFh_m--XtdgwTo4m6Uf7y_3Q-hBt_K4Vztt0iA@mail.gmail.com>
References: 
 <CADkTA4Nt767FgFh_m--XtdgwTo4m6Uf7y_3Q-hBt_K4Vztt0iA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-Spamd-Bar: /
Authentication-Results: mail.optimcloud.com;
	auth=pass smtp.mailfrom=yocto@optimcloud.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Aug 2022 14:21:42 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7545



On Thursday 18 August 2022 20:45:42 PM (+07:00), Bruce Ashfield wrote:

 > On Thu, Aug 18, 2022 at 9:17 AM Bach, Pascal <pascal.bach@siemens.com> 
wrote:
 > >
 > > > >
 > > > > Netavark is replaces cni for podman.
 > > > >
 > > >
 > > > s/is replaces/is a replacement/
 > > >
 > > > Since this can replace CNI, can they co-exist at the same time ? We 
should
 > > > mention that in the commit message. If they both can't be active on 
the
 > > > target at the same time, then we should have a RCONFLICTS in the 
recipe to
 > > > make sure they aren't both installed.
 > > >
 > >
 > > Both can be installed in parallel. And from what I have seen if both 
are installed
 > > podman seems to prefer netavark.

They can be installed together and should, netavark is and will be the 
primary, and you must configure manually to use cni
yet CNI and Netavark cannot be used simultaneously in order to avoid 
conflicts in the configurations the two create.

 >
 > likewise, that is what I was seeing as well. But I've been avoiding it
 > (netavark) for CNI so far :)
 >
 > > The backend can be mahually selected in the podman config
 > > 
https://github.com/containers/common/blob/main/docs/containers.conf.5.md#network-table
 
> > but only one can be used at a time.
 >
 > I can run my multi-container, multi-runtime tests against it at some
 > point (I put all the runtimes, all the frameworks and all the
 > networking on a single image to see what breaks), and then document
 > the results.
 >
 > Bruce
 >
 > >
 > > Pascal
 >
 >
 >

-- 
Sent with Vivaldi Mail. Download Vivaldi for free at vivaldi.com

