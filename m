Return-Path: <jeff.dagenais@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 13835E00F1A; Thu, 30 Jun 2016 20:39:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (jeff.dagenais[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.169 listed in list.dnswl.org]
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B600E00F14
	for <meta-virtualization@yoctoproject.org>;
	Thu, 30 Jun 2016 20:39:21 -0700 (PDT)
Received: by mail-qt0-f169.google.com with SMTP id f89so51880215qtd.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 30 Jun 2016 20:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-transfer-encoding:subject:message-id:date:to
	:mime-version; bh=AyXjtocFbzduamp5Rz4tuP0MQsETjwG2PJ4fa7dsshg=;
	b=u4CxQuZJqtQiG2mdJ8gwWUptzOdYigSOnXlADFLlZlnrYUrAwMShy5l4w0lYlWDFpJ
	jTOSZGrF6lR/bOr7tc71GzsTpbmmRm0AXcQx3qGtv5FED1v/eLKb4Sf8Z9W93SB0uMik
	a75YRmdvM97bBvn8HHU8N+QWKZsz3grgCGpOAoNNwxMEiPSljXIOVajoCQtcoHZnl4Az
	/Ir68N23Hged2p9zNZCKRnEHSNTrueyye5gxs6UHXZQHOimsBWEgsuqPGq2ZeoFYPzUF
	w/ACM0+gZB8onkQXTlDcpD1fesShXVXFN3Bl9QU4ASytM1QCAmnw/rvnOTI84iDAfwTq
	LhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-transfer-encoding:subject
	:message-id:date:to:mime-version;
	bh=AyXjtocFbzduamp5Rz4tuP0MQsETjwG2PJ4fa7dsshg=;
	b=an9DQMe29lwD5IXUOzFt1oP9AWyRfVrE8/HftP4ZC9Pdc7xClO1PW8abKxSNdWrA1+
	8HLZyW6OqcOvRBOBx7gJEdTRYpjxSoV2pdAoMyrpvXmvv/iXqW17HAJdx1e9vpvkIxTm
	vdh17oKRG7+CkAju/HRSft5KmC5bcmffusKwuFj7DKF7R2jjF/AypD35jrdiU5WOeUut
	23sBWWFItpN6wa6EaKIXEvCpENHlfEFOjTb4oN5RSN95AdgC5xIRDcbqlDUlaIqaVpGh
	uc4BKp/jNLpG3uZQbfCAv0Y887yqQUE20w1X10cYX+MDZtJusbNQGBIOwoAU+N7wQNXD
	T5Eg==
X-Gm-Message-State: ALyK8tJrry3KJVx7lQGAHybTknvrwDrvK1jNLuay9TxFpSiX57OdTLvj2zjjdgFtEiZw2g==
X-Received: by 10.200.57.40 with SMTP id s37mr29141920qtb.69.1467344354832;
	Thu, 30 Jun 2016 20:39:14 -0700 (PDT)
Received: from [10.0.0.11] (modemcable020.227-83-70.mc.videotron.ca.
	[70.83.227.20]) by smtp.gmail.com with ESMTPSA id
	m92sm3549317qtd.27.2016.06.30.20.39.12
	for <meta-virtualization@yoctoproject.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Jun 2016 20:39:12 -0700 (PDT)
From: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Message-Id: <E2C6389C-370A-4B0F-81EA-95D6F9F51BFE@gmail.com>
Date: Thu, 30 Jun 2016 23:39:10 -0400
To: meta-virtualization@yoctoproject.org
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Mailer: Apple Mail (2.2098)
Subject: docker: error creating default bridge network: package not installed
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Jul 2016 03:39:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi all,

Ive managed to build docker into my image using meta-virtualization.

Ive used the master branch (c4a1711dd31659b027c70c07e4ef6da98591ac95) on =
top of
which I had to make tiny hacks to get it to compile with fido.

So Im using linux-yocto_3.19.bbappend which I dug out of branch fido.

When I run docker daemon log-level=3Ddebug, I get:

DEBU[0000] /usr/sbin/iptables, [--wait --version]      =20
DEBU[0000] /usr/sbin/iptables, [--wait -t nat -D PREROUTING -m addrtype =
--dst-type LOCAL -j DOCKER]=20
DEBU[0000] /usr/sbin/iptables, [--wait -t nat -D OUTPUT -m addrtype =
--dst-type LOCAL ! --dst 127.0.0.0/8 -j DOCKER]=20
DEBU[0000] /usr/sbin/iptables, [--wait -t nat -D OUTPUT -m addrtype =
--dst-type LOCAL -j DOCKER]=20
DEBU[0000] /usr/sbin/iptables, [--wait -t nat -D PREROUTING]=20
DEBU[0000] /usr/sbin/iptables, [--wait -t nat -D OUTPUT]=20
DEBU[0000] /usr/sbin/iptables, [--wait -t nat -F DOCKER]=20
DEBU[0000] /usr/sbin/iptables, [--wait -t nat -X DOCKER]=20
DEBU[0000] /usr/sbin/iptables, [--wait -t filter -F DOCKER]=20
DEBU[0000] /usr/sbin/iptables, [--wait -t filter -X DOCKER]=20
DEBU[0000] /usr/sbin/iptables, [--wait -t filter -F DOCKER-ISOLATION]=20
DEBU[0000] /usr/sbin/iptables, [--wait -t filter -X DOCKER-ISOLATION]=20
DEBU[0000] /usr/sbin/iptables, [--wait -t nat -n -L DOCKER]=20
DEBU[0000] /usr/sbin/iptables, [--wait -t nat -N DOCKER]=20
DEBU[0000] /usr/sbin/iptables, [--wait -t filter -n -L DOCKER]=20
DEBU[0000] /usr/sbin/iptables, [--wait -t filter -N DOCKER]=20
DEBU[0000] /usr/sbin/iptables, [--wait -t filter -n -L DOCKER-ISOLATION]=20=

DEBU[0000] /usr/sbin/iptables, [--wait -t filter -N DOCKER-ISOLATION]=20
DEBU[0000] /usr/sbin/iptables, [--wait -t filter -C DOCKER-ISOLATION -j =
RETURN]=20
DEBU[0000] /usr/sbin/iptables, [--wait -I DOCKER-ISOLATION -j RETURN]=20
DEBU[0000] Registering ipam driver: "default"          =20
DEBU[0000] Registering ipam driver: "null"             =20
INFO[0000] Default bridge (docker0) is assigned with an IP address =
172.17.0.0/16. Daemon option --bip can be used to set a preferred IP =
address=20
DEBU[0000] Allocating IPv4 pools for network bridge =
(6eeb9cc6567681c6e7f78a2e529db97eaf129ec2acfc4c5568ef74df1d2c1cab)=20
DEBU[0000] RequestPool(LocalDefault, 172.17.0.0/16, , map[], false)=20
DEBU[0000] RequestAddress(LocalDefault/172.17.0.0/16, <nil>, =
map[RequestAddressType:com.docker.network.gateway])=20
DEBU[0000] Failed to create bridge docker0 via netlink. Trying ioctl=20
DEBU[0000] releasing IPv4 pools from network bridge =
(6eeb9cc6567681c6e7f78a2e529db97eaf129ec2acfc4c5568ef74df1d2c1cab)=20
DEBU[0000] ReleaseAddress(LocalDefault/172.17.0.0/16, 172.17.0.1)=20
DEBU[0000] ReleasePool(LocalDefault/172.17.0.0/16)     =20
DEBU[0000] Cleaning up old mountid : start.            =20
FATA[0000] Error starting daemon: Error initializing network controller: =
Error creating default "bridge" network: package not installed=20

I am just guessing my kernel is missing something, so I ran [docker
source]/contribs/check-config.sh against my kernel config and got MANY =
missing
config items:

# ./check-config.sh=20
warning: /proc/config.gz does not exist, searching other paths for =
kernel config ...
info: reading kernel config from /boot/config-3.19.8-yocto-standard ...
Generally Necessary:
- cgroup hierarchy: properly mounted [/sys/fs/cgroup]
- CONFIG_NAMESPACES: enabled
- CONFIG_NET_NS: enabled
- CONFIG_PID_NS: enabled
- CONFIG_IPC_NS: enabled
- CONFIG_UTS_NS: enabled
- CONFIG_DEVPTS_MULTIPLE_INSTANCES: enabled
- CONFIG_CGROUPS: missing
- CONFIG_CGROUP_CPUACCT: missing
- CONFIG_CGROUP_DEVICE: missing
- CONFIG_CGROUP_FREEZER: missing
- CONFIG_CGROUP_SCHED: missing
- CONFIG_CPUSETS: missing
- CONFIG_MEMCG: missing
- CONFIG_KEYS: enabled
- CONFIG_MACVLAN: missing
- CONFIG_VETH: missing
- CONFIG_BRIDGE: missing
- CONFIG_BRIDGE_NETFILTER: missing
- CONFIG_NF_NAT_IPV4: enabled (as module)
- CONFIG_IP_NF_FILTER: enabled (as module)
- CONFIG_IP_NF_TARGET_MASQUERADE: enabled (as module)
- CONFIG_NETFILTER_XT_MATCH_ADDRTYPE: missing
- CONFIG_NETFILTER_XT_MATCH_CONNTRACK: enabled (as module)
- CONFIG_NF_NAT: enabled (as module)
- CONFIG_NF_NAT_NEEDED: enabled
- CONFIG_POSIX_MQUEUE: enabled

Optional Features:
- CONFIG_USER_NS: enabled
- CONFIG_SECCOMP: enabled
- CONFIG_CGROUP_PIDS: missing
- CONFIG_MEMCG_KMEM: missing
- CONFIG_MEMCG_SWAP: missing
- CONFIG_MEMCG_SWAP_ENABLED: missing
- CONFIG_RESOURCE_COUNTERS: missing
- CONFIG_BLK_CGROUP: missing
- CONFIG_IOSCHED_CFQ: enabled
- CONFIG_BLK_DEV_THROTTLING: missing
- CONFIG_CGROUP_PERF: missing
- CONFIG_CGROUP_HUGETLB: missing
- CONFIG_NET_CLS_CGROUP: missing
- CONFIG_CGROUP_NET_PRIO: missing
- CONFIG_CFS_BANDWIDTH: missing
- CONFIG_FAIR_GROUP_SCHED: missing
- CONFIG_RT_GROUP_SCHED: missing


My question is: why isnt all the generally necessary" items being added =
by the
kernel config files (scc) mentioned in meta-virtualization's linux-yocto
bbappend?

Thanks for the help!



