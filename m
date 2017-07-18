Return-Path: <jan.kiszka@web.de>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3B8BAE00C3B; Mon, 17 Jul 2017 23:23:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (jan.kiszka[at]web.de)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [212.227.17.12 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mout.web.de (mout.web.de [212.227.17.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4AEFEE00C39
	for <meta-virtualization@yoctoproject.org>;
	Mon, 17 Jul 2017 23:23:39 -0700 (PDT)
Received: from md1f2u6c.ww002.siemens.net ([95.157.57.47]) by smtp.web.de
	(mrweb103 [213.165.67.124]) with ESMTPSA (Nemesis) id
	0MEmgA-1dRHN22MGI-00FzbC for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Jul 2017 08:23:38 +0200
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <64f97a6c-0430-1441-ffa5-0c218d1635c5@web.de>
Date: Tue, 18 Jul 2017 08:23:38 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
X-Provags-ID: V03:K0:iwUbgXyy+gCEi/c4Aw3u3X1FdJzyAOdMkB+Qlmj9CEzPWhjgMwN
	ET8TkBrZ03wcbC61iTqJZ/WEwAngu+05PJgG47zD17GNbfUIXuvbRfyIkiZrYIAhfDhCAsd
	+XCRV67rolvu1OHx5PP2P4MkH+69o1zCLl/bR5FXgFXZUPjHugZn4jxyvLNSB7SM5u+sHHu
	Ih8HyrCY3IC51Qpy10VgQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:ctz9sN4G/Fk=:VkCZOrJNoVCv7Nnb1svCoH
	tRKvJaI4mHl/JYJmQz3QZzTJ4felkNe7NIvYbEcWaQIrFNkRzI23WRl8b5QlQYj7QJiZtig31
	0hfgAOV27uQj6LEBc9K1ktHbd2ohV4r2MZJi6UB014YJ/Bhcg+FIY7Lqt42AVqEFRP86ZBAe1
	TE6r1w6/BwuUEc+qkE62wIYc8w1unQqYPdB66QtzKjzzZ+zhudp/HcSd7t0H8PMeCbFWxBvJQ
	+DF6NM+jubPUs3jztxrlMFsUjmJJHcQVugzy7L4OnkIPJpUhSU6AJJcxhfBX/iTC7XlH3SoQc
	JNYwzLwj1Cinzi/Akz1dxosyZknsVVf7Chz9RYhM0Ag0wyrysM7hDWEDz7khicPutq0XJTlET
	Z0lIFNkc5vyxYdrfa5RLAVLdPvuMVEuP0mOD8hf6UTT1ez+bYdbzKlvMNgukuUM3HmN32ZxSL
	Jgue5EhQ1V6FoAEhMAZZYxhLF2GPO7t8KHzGEAM5wYThAr0beRCTTRCxnvsc774DhkN0kRXhs
	vtiF7KBfZFmWsWo4z6CjNDE+ySud5oFLdF9uzGdcuuJVyIp52CwXy9fkaNjhBVuMFMDE/nmV7
	JZMatEgOppSAeObK77IwNWKr6nwaqZG+dsq6e8pQ9MXvUmyCXGhtym8NGb7IaCwhGJHEyNOEm
	5yLr9YZkv7jIjyjTSBgWDVxljw6EC/SCV9B5p9MhRvHUzTueyPqD8r1ZzFWRBJ0te7/D1DoEF
	sDPFn2KAa2eOwA96g/quS031hsAEVPjjaoo+g4p50A+lq5e07L7BCaD62XuFQhuxAGWEwA0k/
	fwRF0A5RL0aSpVu7qDI+vpSK8RQfh7eeWLIUACi1n6XSh7Q+e0=
Subject: [PATCH] kernel-features: Fix CONFIG_BLK_CGROUP enabling
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
X-List-Received-Date: Tue, 18 Jul 2017 06:23:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

From: Jan Kiszka <jan.kiszka@siemens.com>

Meanwhile, this became boolean, and trying to make it a module just
leaves it off.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

Do we still needs these config fragments? yocto-kernel-cache seems to
carry similar things by now.

 recipes-kernel/linux/linux-yocto/lxc.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-yocto/lxc.cfg b/recipes-kernel/linux/linux-yocto/lxc.cfg
index fa2344a..c25d60f 100644
--- a/recipes-kernel/linux/linux-yocto/lxc.cfg
+++ b/recipes-kernel/linux/linux-yocto/lxc.cfg
@@ -15,7 +15,7 @@ CONFIG_PID_NS=y
 CONFIG_NET_NS=y
 
 CONFIG_CLS_CGROUP=m
-CONFIG_BLK_CGROUP=m
+CONFIG_BLK_CGROUP=y
 CONFIG_NETPRIO_CGROUP=m
 
 CONFIG_DEVPTS_MULTIPLE_INSTANCES=y
-- 
2.12.3

