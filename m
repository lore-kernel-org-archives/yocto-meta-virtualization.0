Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.5381.1634272855253932139
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 14 Oct 2021 21:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=L/3ZGO7H;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: festevam@denx.de)
Received: from mail.denx.de (unknown [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 15032837DA;
	Fri, 15 Oct 2021 06:40:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1634272852;
	bh=QGFPD1fULO4n9cBKS9UUultei+j3l2kwdspESlQGuzY=;
	h=Date:From:To:Cc:Subject:From;
	b=L/3ZGO7H/N/PsYcVabm2P9anheSm/p7y5cKk/QBCETaYa6xICcxbFAP4LRcXfBGLS
	 Hma7zr1DNyPV/+aKifFqNhXQkpQY9CWDPuUeHaM3btxOH/1piVoQqiG+p9hCdjLZhO
	 ccftV50wE8BFW5Ny53o8G23miuCnyOCMLpj/TdYvF4CwitilxFPI2FoZp7mNEEmUG/
	 Hcul9NkgE5ePjwq2Cn6B56IO1gjSIona5qeqQiBv7nANjt6+GqNGqnK9mOJ4XE+Oos
	 weRMoraoNPP90SltctUp3KTF/KxXxL3LukEG4kAdQSVLmy90RINb/WlXBAAueqCJ5R
	 49pPcYqTEIuhQ==
MIME-Version: 1.0
Date: Fri, 15 Oct 2021 01:40:52 -0300
From: "Fabio Estevam" <festevam@denx.de>
To: bruce.ashfield@gmail.com, Nathan.Dunne@arm.com
Cc: meta-virtualization@lists.yoctoproject.org, otavio@ossystems.com.br
Subject: ip6tables executable not getting installed in dunfell
Message-ID: <ad014c7cc4e8d1bcd4f499229d09e013@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I am running the dunfell branch and I notice
that ip6tables is not getting installed:

# podman run hello-world
Trying to pull docker.io/library/hello-world...
Getting image source signatures
Copying blob 93288797bd35 done
Copying config 18e5af7904 done
Writing manifest to image destination
Storing signatures
[   41.667476] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[   41.674442] cni-podman0: port 1(veth5ab23089) entered blocking state
[   41.680912] cni-podman0: port 1(veth5ab23089) entered disabled state
[   41.687634] device veth5ab23089 entered promiscuous mode
[   41.693058] audit: type=1700 audit(1634272456.424:3): 
dev=veth5ab23089 prom=256 old_prom=0 auid=4294967295 uid=0 gid=0 
ses=4294967295
[   41.694135] cni-podman0: port 1(veth5ab23089) entered blocking state
[   41.711492] cni-podman0: port 1(veth5ab23089) entered forwarding 
state
[   41.856399] audit: type=1325 audit(1634272456.604:4): table=nat 
family=2 entries=0 op=xt_register pid=481 comm="modprobe"
[   41.867521] audit: type=1325 audit(1634272456.612:5): table=nat 
family=2 entries=5 op=xt_replace pid=482 comm="iptables"
[   41.883462] audit: type=1325 audit(1634272456.632:6): table=nat 
family=2 entries=7 op=xt_replace pid=485 comm="iptables"
[   41.899451] audit: type=1325 audit(1634272456.648:7): table=nat 
family=2 entries=8 op=xt_replace pid=488 comm="iptables"
[   41.910483] audit: type=1325 audit(1634272456.656:8): table=nat 
family=2 entries=9 op=xt_replace pid=490 comm="iptables"
ERRO[0004] Error adding network: could not initialize iptables protocol 
1: exec: "ip6tables": executable file not found in $PATH
ERRO[0004] Error while adding pod to CNI network "podman": could not 
initialize iptables protocol 1: exec: "ip6tables": executable file not 
found in $PATH
[   41.973531] cni-podman0: port 1(veth5ab23089) entered disabled state
[   41.981035] device veth5ab23089 left promiscuous mode
[   41.986213] cni-podman0: port 1(veth5ab23089) entered disabled state
[   41.986238] audit: type=1700 audit(1634272456.736:9): 
dev=veth5ab23089 prom=0 old_prom=256 auid=4294967295 uid=0 gid=0 
ses=4294967295
Error: error configuring network namespace for container 
173dbac37c7b288e2a932ef9e6fa2c05c50a30305f46b1ddbd6208b8d77e76de: could 
not initialize iptables protocol 1: exec: "ip6tables": executable file 
not found in $PATH

What could be the reason for ip6tables executable not getting installed?

I have also cherry-picked the commit below to dunfell, but it did not 
help:
https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=35fce40e86c6cd475d24136c699ae1f2821dea85

Thanks,

Fabio Estevam
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-60 Fax: (+49)-8142-66989-80 Email: 
festevam@denx.de
