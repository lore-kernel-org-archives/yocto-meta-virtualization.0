Return-Path: <kurt.bodiker@braintrust-us.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 36872E00BF6; Fri,  6 Apr 2018 10:07:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.220.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 41BF3E00956
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Apr 2018 10:07:32 -0700 (PDT)
Received: by mail-qk0-f196.google.com with SMTP id o205so1895091qke.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 06 Apr 2018 10:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=braintrust-us-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:in-reply-to:references:content-transfer-encoding;
	bh=1/COQutTxshDiz0mPUwjOWlwZwSwTQxi2EO7uHztYEk=;
	b=QHCwG8g3Yhb7/lXztwaPG4BVdrF7J1GSFyncWVkvRZDgCN+KqEOQ/9oFeKYuo9SyY3
	RChen5sXSJiNXC/8B/38JPfL+Ef42bAjnfb58u78yfvnUWTSmo/MS2bIXQTnB1Zhfv/a
	FtDjXDren8k2GTZVQXrF8PDbu2X+qi3Sd3z2P+o9sJHi3okRp0JDOawdNLRkvSojJncX
	8VpKnL6VHF8WPRORtX1ZwNEaqpAq4LIb7aMkh6XvxlGhRh8WpkjRqSV8F7mO6lVo7vdr
	aANdgiDmx5a2ybVFrrh4lYG3YzG0ZOQWkrnrWAvXymh9LyvsXnwb4HIW+8Jomono9gr+
	vCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=1/COQutTxshDiz0mPUwjOWlwZwSwTQxi2EO7uHztYEk=;
	b=aOI9lQ4YruLjFq6RRmyGY9XKn88vNrMouQOY8PojR0xH9RhBz5cyEzG5709weZeoou
	5n/Cka/iMLk2EiQs2GOGzTASGH30REMkzbVLxboxjqxIDWCshny57m4cD4u9ur20SIMs
	oj4mN0qNjnFwKgvkIwJT+Aqyx8PmVgPY0mypUZUzEJG7GNW2P4pXl1xyro+tU7WRSgk8
	dAxqBJ1dU4EumU/ePurVxqkd2r+YkDBL/grTFgsZ1m1o4JSAVHPYcR2OcJKHGqDnotHE
	hI7pnPsLxr+uuraD9CsTsHFWbKsNXCJMVzsZbln9baNr65gnBM3XshgxF4rpeI+64KQx
	GotA==
X-Gm-Message-State: ALQs6tCZyUq/U+p6GKMDx1c7WLHh8UY/KR+0qBWO+IjDeVmNFDuu8+lg
	ChozAQmSde187tsm3VcRhRMpHbO1UDeXFfyZbRNYqtvaCP+FPiT1lsXQFMQTOh3EO9GkppOYu5v
	LjpvBtsW8pT0csnS34xKg1kCKGsxUotY=
X-Google-Smtp-Source: AIpwx4+8VeLa6aKy2XmGOmOKDCRBqFXFzTduEGsrRAiNmb0l9NI9VfwQxwntGtj4xydN981UG794SQ==
X-Received: by 10.55.67.134 with SMTP id q128mr35346667qka.51.1523034449200;
	Fri, 06 Apr 2018 10:07:29 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
	by smtp.gmail.com with ESMTPSA id
	y66sm8290900qky.61.2018.04.06.10.07.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 06 Apr 2018 10:07:28 -0700 (PDT)
From: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
To: meta-virtualization@yoctoproject.org
Date: Fri,  6 Apr 2018 13:06:39 -0400
Message-Id: <cc1929a6e9bedfe3ec2d4531b9f1ecac932f4c14.1522956183.git.kurt.bodiker@braintrust-us.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1522956183.git.kurt.bodiker@braintrust-us.com>
References: <cover.1522956183.git.kurt.bodiker@braintrust-us.com>
MIME-Version: 1.0
In-Reply-To: <cover.1522956183.git.kurt.bodiker@braintrust-us.com>
References: <cover.1522956183.git.kurt.bodiker@braintrust-us.com>
Cc: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
Subject: [PATCH v2 2/8] xen: LWIP source code with patches applied for stubdoms
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
X-List-Received-Date: Fri, 06 Apr 2018 17:07:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

lwIP is a small implementation of the TCP/IP stack designed for use in
embedded systems. This lwIP recipe does not configure nor does it build
the product. Instead, this recipe applies the patches normally found in
the Xen/stubdom source tree and creates a source package that can be
used for cross-compiling for MiniOS.

The current Xen source code is hardcoded to fetch a specific version of
this package. The patch files originate from the Xen/stubdom source
tree. This recipe provides the flexibility to change version or modify
the patches.

Signed-off-by: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
---
Changes in v2:
 - Multi-line variables formatted to match OE style guide
 - SRC_URI formatted to use SRCREV rather than git tag
 - patches formatted to striplevel=3D1
---
 .../lwip.dhcp_create_request-hwaddr_len.patch      |   13 +
 recipes-extended/xen/files/lwip.patch-cvs          | 2398 ++++++++++++++++=
++++
 recipes-extended/xen/lwip.inc                      |   24 +
 recipes-extended/xen/lwip_1.3.0.bb                 |   19 +
 4 files changed, 2454 insertions(+)
 create mode 100644 recipes-extended/xen/files/lwip.dhcp_create_request-hwa=
ddr_len.patch
 create mode 100644 recipes-extended/xen/files/lwip.patch-cvs
 create mode 100644 recipes-extended/xen/lwip.inc
 create mode 100644 recipes-extended/xen/lwip_1.3.0.bb

diff --git a/recipes-extended/xen/files/lwip.dhcp_create_request-hwaddr_len=
.patch b/recipes-extended/xen/files/lwip.dhcp_create_request-hwaddr_len.pat=
ch
new file mode 100644
index 0000000..4bbf21a
--- /dev/null
+++ b/recipes-extended/xen/files/lwip.dhcp_create_request-hwaddr_len.patch
@@ -0,0 +1,13 @@
+Index: src/core/dhcp.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- a/src/core/dhcp.c
++++ b/src/core/dhcp.c
+@@ -1356,7 +1358,7 @@ dhcp_create_request(struct netif *netif)
+   dhcp->msg_out->giaddr.addr =3D 0;
+   for (i =3D 0; i < DHCP_CHADDR_LEN; i++) {
+     /* copy netif hardware address, pad with zeroes */
+-    dhcp->msg_out->chaddr[i] =3D (i < netif->hwaddr_len) ? netif->hwaddr[=
i] : 0/* pad byte*/;
++    dhcp->msg_out->chaddr[i] =3D (i < (netif->hwaddr_len > NETIF_MAX_HWAD=
DR_LEN ? NETIF_MAX_HWADDR_LEN : netif->hwaddr_len)) ? netif->hwaddr[i] : 0/=
* pad byte*/;
+   }
+   for (i =3D 0; i < DHCP_SNAME_LEN; i++) {
+     dhcp->msg_out->sname[i] =3D 0;
diff --git a/recipes-extended/xen/files/lwip.patch-cvs b/recipes-extended/x=
en/files/lwip.patch-cvs
new file mode 100644
index 0000000..8df9581
--- /dev/null
+++ b/recipes-extended/xen/files/lwip.patch-cvs
@@ -0,0 +1,2398 @@
+? .ChangeLog.swp
+? ChangeLog
+Index: CHANGELOG
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/CHANGELOG,v
+retrieving revision 1.300
+retrieving revision 1.318
+diff -u -p -r1.300 -r1.318
+--- a/CHANGELOG	23 Mar 2008 13:49:39 -0000	1.300
++++ b/CHANGELOG	14 Jul 2008 20:12:36 -0000	1.318
+@@ -19,9 +19,77 @@ HISTORY
+=20
+   ++ New features:
+=20
++  2008-06-30 Simon Goldschmidt
++  * mem.c, opt.h, stats.h: fixed bug #21433: Calling mem_free/pbuf_free f=
rom
++    interrupt context isn't safe: LWIP_ALLOW_MEM_FREE_FROM_OTHER_CONTEXT =
allows
++    mem_free to run between mem_malloc iterations. Added illegal counter =
for
++    mem stats.
++
++  2008-06-27 Simon Goldschmidt
++  * stats.h/.c, some other files: patch #6483: stats module improvement:
++    Added defines to display each module's statistic individually, added =
stats
++    defines for MEM, MEMP and SYS modules, removed (unused) rexmit counte=
r.
++
++  2008-06-17 Simon Goldschmidt
++  * err.h: patch #6459: Made err_t overridable to use a more efficient ty=
pe
++    (define LWIP_ERR_T in cc.h)
++
++  2008-06-17 Simon Goldschmidt
++  * slipif.c: patch #6480: Added a configuration option for slipif for sy=
mmetry
++    to loopif
++
++  2008-06-17 Simon Goldschmidt (patch by Luca Ceresoli)
++  * netif.c, loopif.c, ip.c, netif.h, loopif.h, opt.h: Checked in slightl=
y
++    modified version of patch # 6370: Moved loopif code to netif.c so tha=
t
++    loopback traffic is supported on all netifs (all local IPs).
++    Added option to limit loopback packets for each netifs.
++
+=20
+   ++ Bugfixes:
+=20
++  2008-08-14 Simon Goldschmidt
++  * api_msg.c: fixed bug #23847: do_close_internal references freed memor=
y (when
++    tcp_close returns !=3D ERR_OK)
++
++  2008-07-08 Fr=C3=A9d=C3=A9ric Bernon
++  * stats.h: Fix some build bugs introduced with patch #6483 (missing som=
e parameters
++    in macros, mainly if MEM_STATS=3D0 and MEMP_STATS=3D0).
++
++  2008-06-24 Jonathan Larmour
++  * tcp_in.c: Fix for bug #23693 as suggested by Art R. Ensure cseg is un=
used
++    if tcp_seg_copy fails.
++
++  2008-06-17 Simon Goldschmidt
++  * inet_chksum.c: Checked in some ideas of patch #6460 (loop optimizatio=
ns)
++    and created defines for swapping bytes and folding u32 to u16.
++
++  2008-05-30 Kieran Mansley
++  * tcp_in.c Remove redundant "if" statement, and use real rcv_wnd
++    rather than rcv_ann_wnd when deciding if packets are in-window.
++    Contributed by <arasmussen@consultant.datasys.swri.edu>
++
++  2008-05-30 Kieran Mansley
++  * mem.h: Fix BUG#23254.  Change macro definition of mem_* to allow
++    passing as function pointers when MEM_LIBC_MALLOC is defined.
++
++  2008-05-09 Jonathan Larmour
++  * err.h, err.c, sockets.c: Fix bug #23119: Reorder timeout error code t=
o
++    stop it being treated as a fatal error.
++
++  2008-04-15 Simon Goldschmidt
++  * dhcp.c: fixed bug #22804: dhcp_stop doesn't clear NETIF_FLAG_DHCP
++    (flag now cleared)
++
++  2008-03-27 Simon Goldschmidt
++  * mem.c, tcpip.c, tcpip.h, opt.h: fixed bug #21433 (Calling mem_free/pb=
uf_free
++    from interrupt context isn't safe): set LWIP_USE_HEAP_FROM_INTERRUPT =
to 1
++    in lwipopts.h or use pbuf_free_callback(p)/mem_free_callback(m) to fr=
ee pbufs
++    or heap memory from interrupt context
++
++  2008-03-26 Simon Goldschmidt
++  * tcp_in.c, tcp.c: fixed bug #22249: division by zero could occur if a =
remote
++    host sent a zero mss as TCP option.
++
+=20
+ (STABLE-1.3.0)
+=20
+Index: src/api/api_msg.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/src/api/api_msg.c,v
+retrieving revision 1.102
+retrieving revision 1.104
+diff -u -p -r1.102 -r1.104
+--- a/src/api/api_msg.c	21 Mar 2008 16:23:14 -0000	1.102
++++ b/src/api/api_msg.c	15 Jul 2008 11:18:58 -0000	1.104
+@@ -598,11 +598,16 @@ do_close_internal(struct netconn *conn)
+   LWIP_ASSERT("pcb already closed", (conn->pcb.tcp !=3D NULL));
+=20
+   /* Set back some callback pointers */
++  tcp_arg(conn->pcb.tcp, NULL);
+   if (conn->pcb.tcp->state =3D=3D LISTEN) {
+-    tcp_arg(conn->pcb.tcp, NULL);
+     tcp_accept(conn->pcb.tcp, NULL);
+   } else {
+     tcp_recv(conn->pcb.tcp, NULL);
++    tcp_accept(conn->pcb.tcp, NULL);
++    /* some callbacks have to be reset if tcp_close is not successful */
++    tcp_sent(conn->pcb.tcp, NULL);
++    tcp_poll(conn->pcb.tcp, NULL, 4);
++    tcp_err(conn->pcb.tcp, NULL);
+   }
+   /* Try to close the connection */
+   err =3D tcp_close(conn->pcb.tcp);
+@@ -610,11 +615,6 @@ do_close_internal(struct netconn *conn)
+     /* Closing succeeded */
+     conn->state =3D NETCONN_NONE;
+     /* Set back some callback pointers as conn is going away */
+-    tcp_err(conn->pcb.tcp, NULL);
+-    tcp_poll(conn->pcb.tcp, NULL, 4);
+-    tcp_sent(conn->pcb.tcp, NULL);
+-    tcp_recv(conn->pcb.tcp, NULL);
+-    tcp_arg(conn->pcb.tcp, NULL);
+     conn->pcb.tcp =3D NULL;
+     conn->err =3D ERR_OK;
+     /* Trigger select() in socket layer. This send should something else =
so the
+@@ -623,6 +623,14 @@ do_close_internal(struct netconn *conn)
+     API_EVENT(conn, NETCONN_EVT_SENDPLUS, 0);
+     /* wake up the application task */
+     sys_sem_signal(conn->op_completed);
++  } else {
++    /* Closing failed, restore some of the callbacks */
++    /* Closing of listen pcb will never fail! */
++    LWIP_ASSERT("Closing a listen pcb may not fail!", (conn->pcb.tcp->sta=
te !=3D LISTEN));
++    tcp_sent(conn->pcb.tcp, sent_tcp);
++    tcp_poll(conn->pcb.tcp, poll_tcp, 4);
++    tcp_err(conn->pcb.tcp, err_tcp);
++    tcp_arg(conn->pcb.tcp, conn);
+   }
+   /* If closing didn't succeed, we get called again either
+      from poll_tcp or from sent_tcp */
+Index: src/api/err.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/src/api/err.c,v
+retrieving revision 1.11
+retrieving revision 1.12
+diff -u -p -r1.11 -r1.12
+--- a/src/api/err.c	13 Dec 2007 23:06:50 -0000	1.11
++++ b/src/api/err.c	9 May 2008 12:14:23 -0000	1.12
+@@ -44,17 +44,17 @@ static const char *err_strerr[] =3D {
+            "Ok.",                    /* ERR_OK          0  */
+            "Out of memory error.",   /* ERR_MEM        -1  */
+            "Buffer error.",          /* ERR_BUF        -2  */
+-           "Routing problem.",       /* ERR_RTE        -3  */
+-           "Connection aborted.",    /* ERR_ABRT       -4  */
+-           "Connection reset.",      /* ERR_RST        -5  */
+-           "Connection closed.",     /* ERR_CLSD       -6  */
+-           "Not connected.",         /* ERR_CONN       -7  */
+-           "Illegal value.",         /* ERR_VAL        -8  */
+-           "Illegal argument.",      /* ERR_ARG        -9  */
+-           "Address in use.",        /* ERR_USE        -10 */
+-           "Low-level netif error.", /* ERR_IF         -11 */
+-           "Already connected.",     /* ERR_ISCONN     -12 */
+-           "Timeout.",               /* ERR_TIMEOUT    -13 */
++           "Timeout.",               /* ERR_TIMEOUT    -3 */
++           "Routing problem.",       /* ERR_RTE        -4  */
++           "Connection aborted.",    /* ERR_ABRT       -5  */
++           "Connection reset.",      /* ERR_RST        -6  */
++           "Connection closed.",     /* ERR_CLSD       -7  */
++           "Not connected.",         /* ERR_CONN       -8  */
++           "Illegal value.",         /* ERR_VAL        -9  */
++           "Illegal argument.",      /* ERR_ARG        -10 */
++           "Address in use.",        /* ERR_USE        -11 */
++           "Low-level netif error.", /* ERR_IF         -12 */
++           "Already connected.",     /* ERR_ISCONN     -13 */
+            "Operation in progress."  /* ERR_INPROGRESS -14 */
+ };
+=20
+Index: src/api/netdb.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/src/api/netdb.c,v
+retrieving revision 1.4
+retrieving revision 1.5
+diff -u -p -r1.4 -r1.5
+--- a/src/api/netdb.c	26 Jan 2008 16:11:39 -0000	1.4
++++ b/src/api/netdb.c	16 Jul 2008 20:36:12 -0000	1.5
+@@ -326,7 +326,8 @@ lwip_getaddrinfo(const char *nodename, c
+   if (nodename !=3D NULL) {
+     /* copy nodename to canonname if specified */
+     size_t namelen =3D strlen(nodename);
+-    ai->ai_canonname =3D mem_malloc(namelen + 1);
++    LWIP_ASSERT("namelen is too long", (namelen + 1) <=3D (mem_size_t)-1)=
;
++    ai->ai_canonname =3D mem_malloc((mem_size_t)(namelen + 1));
+     if (ai->ai_canonname =3D=3D NULL) {
+       goto memerr;
+     }
+Index: src/api/sockets.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/src/api/sockets.c,v
+retrieving revision 1.116
+retrieving revision 1.117
+diff -u -p -r1.116 -r1.117
+--- a/src/api/sockets.c	13 Mar 2008 20:03:57 -0000	1.116
++++ b/src/api/sockets.c	9 May 2008 12:14:24 -0000	1.117
+@@ -128,17 +128,17 @@ static const int err_to_errno_table[] =3D=20
+   0,             /* ERR_OK          0      No error, everything OK. */
+   ENOMEM,        /* ERR_MEM        -1      Out of memory error.     */
+   ENOBUFS,       /* ERR_BUF        -2      Buffer error.            */
+-  EHOSTUNREACH,  /* ERR_RTE        -3      Routing problem.         */
+-  ECONNABORTED,  /* ERR_ABRT       -4      Connection aborted.      */
+-  ECONNRESET,    /* ERR_RST        -5      Connection reset.        */
+-  ESHUTDOWN,     /* ERR_CLSD       -6      Connection closed.       */
+-  ENOTCONN,      /* ERR_CONN       -7      Not connected.           */
+-  EINVAL,        /* ERR_VAL        -8      Illegal value.           */
+-  EIO,           /* ERR_ARG        -9      Illegal argument.        */
+-  EADDRINUSE,    /* ERR_USE        -10     Address in use.          */
+-  -1,            /* ERR_IF         -11     Low-level netif error    */
+-  -1,            /* ERR_ISCONN     -12     Already connected.       */
+-  ETIMEDOUT,     /* ERR_TIMEOUT    -13     Timeout                  */
++  ETIMEDOUT,     /* ERR_TIMEOUT    -3      Timeout                  */
++  EHOSTUNREACH,  /* ERR_RTE        -4      Routing problem.         */
++  ECONNABORTED,  /* ERR_ABRT       -5      Connection aborted.      */
++  ECONNRESET,    /* ERR_RST        -6      Connection reset.        */
++  ESHUTDOWN,     /* ERR_CLSD       -7      Connection closed.       */
++  ENOTCONN,      /* ERR_CONN       -8      Not connected.           */
++  EINVAL,        /* ERR_VAL        -9      Illegal value.           */
++  EIO,           /* ERR_ARG        -10     Illegal argument.        */
++  EADDRINUSE,    /* ERR_USE        -11     Address in use.          */
++  -1,            /* ERR_IF         -12     Low-level netif error    */
++  -1,            /* ERR_ISCONN     -13     Already connected.       */
+   EINPROGRESS    /* ERR_INPROGRESS -14     Operation in progress    */
+ };
+=20
+Index: src/api/tcpip.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/src/api/tcpip.c,v
+retrieving revision 1.70
+retrieving revision 1.73
+diff -u -p -r1.70 -r1.73
+--- a/src/api/tcpip.c	12 Jan 2008 11:52:22 -0000	1.70
++++ b/src/api/tcpip.c	27 Jun 2008 20:34:51 -0000	1.73
+@@ -518,4 +518,42 @@ tcpip_init(void (* initfunc)(void *), vo
+   sys_thread_new(TCPIP_THREAD_NAME, tcpip_thread, NULL, TCPIP_THREAD_STAC=
KSIZE, TCPIP_THREAD_PRIO);
+ }
+=20
++/**
++ * Simple callback function used with tcpip_callback to free a pbuf
++ * (pbuf_free has a wrong signature for tcpip_callback)
++ *
++ * @param p The pbuf (chain) to be dereferenced.
++ */
++static void
++pbuf_free_int(void *p)
++{
++  struct pbuf *q =3D p;
++  pbuf_free(q);
++}
++
++/**
++ * A simple wrapper function that allows you to free a pbuf from interrup=
t context.
++ *
++ * @param p The pbuf (chain) to be dereferenced.
++ * @return ERR_OK if callback could be enqueued, an err_t if not
++ */
++err_t
++pbuf_free_callback(struct pbuf *p)
++{
++  return tcpip_callback_with_block(pbuf_free_int, p, 0);
++}
++
++/**
++ * A simple wrapper function that allows you to free heap memory from
++ * interrupt context.
++ *
++ * @param m the heap memory to free
++ * @return ERR_OK if callback could be enqueued, an err_t if not
++ */
++err_t
++mem_free_callback(void *m)
++{
++  return tcpip_callback_with_block(mem_free, m, 0);
++}
++
+ #endif /* !NO_SYS */
+Index: src/core/dhcp.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/src/core/dhcp.c,v
+retrieving revision 1.86
+retrieving revision 1.87
+diff -u -p -r1.86 -r1.87
+--- a/src/core/dhcp.c	4 Mar 2008 14:25:58 -0000	1.86
++++ b/src/core/dhcp.c	15 Apr 2008 17:24:55 -0000	1.87
+@@ -568,6 +568,8 @@ dhcp_start(struct netif *netif)
+   LWIP_ERROR("netif !=3D NULL", (netif !=3D NULL), return ERR_ARG;);
+   dhcp =3D netif->dhcp;
+   LWIP_DEBUGF(DHCP_DEBUG | LWIP_DBG_TRACE | LWIP_DBG_STATE, ("dhcp_start(=
netif=3D%p) %c%c%"U16_F"\n", (void*)netif, netif->name[0], netif->name[1], =
(u16_t)netif->num));
++  /* Remove the flag that says this netif is handled by DHCP,
++     it is set when we succeeded starting. */
+   netif->flags &=3D ~NETIF_FLAG_DHCP;
+=20
+   /* no DHCP client attached yet? */
+@@ -609,6 +611,7 @@ dhcp_start(struct netif *netif)
+     dhcp_stop(netif);
+     return ERR_MEM;
+   }
++  /* Set the flag that says this netif is handled by DHCP. */
+   netif->flags |=3D NETIF_FLAG_DHCP;
+   return result;
+ }
+@@ -1063,6 +1066,8 @@ dhcp_stop(struct netif *netif)
+ {
+   struct dhcp *dhcp =3D netif->dhcp;
+   LWIP_ERROR("dhcp_stop: netif !=3D NULL", (netif !=3D NULL), return;);
++  /* Remove the flag that says this netif is handled by DHCP. */
++  netif->flags &=3D ~NETIF_FLAG_DHCP;
+=20
+   LWIP_DEBUGF(DHCP_DEBUG | LWIP_DBG_TRACE | 3, ("dhcp_stop()\n"));
+   /* netif is DHCP configured? */
+Index: src/core/mem.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/src/core/mem.c,v
+retrieving revision 1.59
+retrieving revision 1.62
+diff -u -p -r1.59 -r1.62
+--- a/src/core/mem.c	4 Mar 2008 16:31:32 -0000	1.59
++++ b/src/core/mem.c	30 Jun 2008 18:16:51 -0000	1.62
+@@ -177,9 +177,36 @@ static u8_t *ram;
+ static struct mem *ram_end;
+ /** pointer to the lowest free block, this is used for faster search */
+ static struct mem *lfree;
++
+ /** concurrent access protection */
+ static sys_sem_t mem_sem;
+=20
++#if LWIP_ALLOW_MEM_FREE_FROM_OTHER_CONTEXT
++
++static volatile u8_t mem_free_count;
++
++/* Allow mem_free from other (e.g. interrupt) context */
++#define LWIP_MEM_FREE_DECL_PROTECT()  SYS_ARCH_DECL_PROTECT(lev_free)
++#define LWIP_MEM_FREE_PROTECT()       SYS_ARCH_PROTECT(lev_free)
++#define LWIP_MEM_FREE_UNPROTECT()     SYS_ARCH_UNPROTECT(lev_free)
++#define LWIP_MEM_ALLOC_DECL_PROTECT() SYS_ARCH_DECL_PROTECT(lev_alloc)
++#define LWIP_MEM_ALLOC_PROTECT()      SYS_ARCH_PROTECT(lev_alloc)
++#define LWIP_MEM_ALLOC_UNPROTECT()    SYS_ARCH_UNPROTECT(lev_alloc)
++
++#else /* LWIP_ALLOW_MEM_FREE_FROM_OTHER_CONTEXT */
++
++/* Protect the heap only by using a semaphore */
++#define LWIP_MEM_FREE_DECL_PROTECT()
++#define LWIP_MEM_FREE_PROTECT()    sys_arch_sem_wait(mem_sem, 0)
++#define LWIP_MEM_FREE_UNPROTECT()  sys_sem_signal(mem_sem)
++/* mem_malloc is protected using semaphore AND LWIP_MEM_ALLOC_PROTECT */
++#define LWIP_MEM_ALLOC_DECL_PROTECT()
++#define LWIP_MEM_ALLOC_PROTECT()
++#define LWIP_MEM_ALLOC_UNPROTECT()
++
++#endif /* LWIP_ALLOW_MEM_FREE_FROM_OTHER_CONTEXT */
++
++
+ /**
+  * "Plug holes" by combining adjacent empty struct mems.
+  * After this function is through, there should not exist
+@@ -255,9 +282,7 @@ mem_init(void)
+   /* initialize the lowest-free pointer to the start of the heap */
+   lfree =3D (struct mem *)ram;
+=20
+-#if MEM_STATS
+-  lwip_stats.mem.avail =3D MEM_SIZE_ALIGNED;
+-#endif /* MEM_STATS */
++  MEM_STATS_AVAIL(avail, MEM_SIZE_ALIGNED);
+ }
+=20
+ /**
+@@ -270,6 +295,7 @@ void
+ mem_free(void *rmem)
+ {
+   struct mem *mem;
++  LWIP_MEM_FREE_DECL_PROTECT();
+=20
+   if (rmem =3D=3D NULL) {
+     LWIP_DEBUGF(MEM_DEBUG | LWIP_DBG_TRACE | 2, ("mem_free(p =3D=3D NULL)=
 was called.\n"));
+@@ -277,20 +303,20 @@ mem_free(void *rmem)
+   }
+   LWIP_ASSERT("mem_free: sanity check alignment", (((mem_ptr_t)rmem) & (M=
EM_ALIGNMENT-1)) =3D=3D 0);
+=20
+-  /* protect the heap from concurrent access */
+-  sys_arch_sem_wait(mem_sem, 0);
+-
+   LWIP_ASSERT("mem_free: legal memory", (u8_t *)rmem >=3D (u8_t *)ram &&
+     (u8_t *)rmem < (u8_t *)ram_end);
+=20
+   if ((u8_t *)rmem < (u8_t *)ram || (u8_t *)rmem >=3D (u8_t *)ram_end) {
++    SYS_ARCH_DECL_PROTECT(lev);
+     LWIP_DEBUGF(MEM_DEBUG | 3, ("mem_free: illegal memory\n"));
+-#if MEM_STATS
+-    ++lwip_stats.mem.err;
+-#endif /* MEM_STATS */
+-    sys_sem_signal(mem_sem);
++    /* protect mem stats from concurrent access */
++    SYS_ARCH_PROTECT(lev);
++    MEM_STATS_INC(illegal);
++    SYS_ARCH_UNPROTECT(lev);
+     return;
+   }
++  /* protect the heap from concurrent access */
++  LWIP_MEM_FREE_PROTECT();
+   /* Get the corresponding struct mem ... */
+   mem =3D (struct mem *)((u8_t *)rmem - SIZEOF_STRUCT_MEM);
+   /* ... which has to be in a used state ... */
+@@ -303,13 +329,14 @@ mem_free(void *rmem)
+     lfree =3D mem;
+   }
+=20
+-#if MEM_STATS
+-  lwip_stats.mem.used -=3D mem->next - ((u8_t *)mem - ram);
+-#endif /* MEM_STATS */
++  MEM_STATS_DEC_USED(used, mem->next - ((u8_t *)mem - ram));
+=20
+   /* finally, see if prev or next are free also */
+   plug_holes(mem);
+-  sys_sem_signal(mem_sem);
++#if LWIP_ALLOW_MEM_FREE_FROM_OTHER_CONTEXT
++  mem_free_count =3D 1;
++#endif /* LWIP_ALLOW_MEM_FREE_FROM_OTHER_CONTEXT */
++  LWIP_MEM_FREE_UNPROTECT();
+ }
+=20
+ /**
+@@ -321,6 +348,8 @@ mem_free(void *rmem)
+  * @param newsize required size after shrinking (needs to be smaller than=
 or
+  *                equal to the previous size)
+  * @return for compatibility reasons: is always =3D=3D rmem, at the momen=
t
++ *         or NULL if newsize is > old size, in which case rmem is NOT to=
uched
++ *         or freed!
+  */
+ void *
+ mem_realloc(void *rmem, mem_size_t newsize)
+@@ -328,6 +357,8 @@ mem_realloc(void *rmem, mem_size_t newsi
+   mem_size_t size;
+   mem_size_t ptr, ptr2;
+   struct mem *mem, *mem2;
++  /* use the FREE_PROTECT here: it protects with sem OR SYS_ARCH_PROTECT =
*/
++  LWIP_MEM_FREE_DECL_PROTECT();
+=20
+   /* Expand the size of the allocated memory region so that we can
+      adjust for alignment. */
+@@ -346,7 +377,12 @@ mem_realloc(void *rmem, mem_size_t newsi
+    (u8_t *)rmem < (u8_t *)ram_end);
+=20
+   if ((u8_t *)rmem < (u8_t *)ram || (u8_t *)rmem >=3D (u8_t *)ram_end) {
++    SYS_ARCH_DECL_PROTECT(lev);
+     LWIP_DEBUGF(MEM_DEBUG | 3, ("mem_realloc: illegal memory\n"));
++    /* protect mem stats from concurrent access */
++    SYS_ARCH_PROTECT(lev);
++    MEM_STATS_INC(illegal);
++    SYS_ARCH_UNPROTECT(lev);
+     return rmem;
+   }
+   /* Get the corresponding struct mem ... */
+@@ -366,11 +402,9 @@ mem_realloc(void *rmem, mem_size_t newsi
+   }
+=20
+   /* protect the heap from concurrent access */
+-  sys_arch_sem_wait(mem_sem, 0);
++  LWIP_MEM_FREE_PROTECT();
+=20
+-#if MEM_STATS
+-  lwip_stats.mem.used -=3D (size - newsize);
+-#endif /* MEM_STATS */
++  MEM_STATS_DEC_USED(used, (size - newsize));
+=20
+   mem2 =3D (struct mem *)&ram[mem->next];
+   if(mem2->used =3D=3D 0) {
+@@ -426,7 +460,10 @@ mem_realloc(void *rmem, mem_size_t newsi
+     -> don't do anyhting.=20
+     -> the remaining space stays unused since it is too small
+   } */
+-  sys_sem_signal(mem_sem);
++#if LWIP_ALLOW_MEM_FREE_FROM_OTHER_CONTEXT
++  mem_free_count =3D 1;
++#endif /* LWIP_ALLOW_MEM_FREE_FROM_OTHER_CONTEXT */
++  LWIP_MEM_FREE_UNPROTECT();
+   return rmem;
+ }
+=20
+@@ -444,6 +481,10 @@ mem_malloc(mem_size_t size)
+ {
+   mem_size_t ptr, ptr2;
+   struct mem *mem, *mem2;
++#if LWIP_ALLOW_MEM_FREE_FROM_OTHER_CONTEXT
++  u8_t local_mem_free_count =3D 0;
++#endif /* LWIP_ALLOW_MEM_FREE_FROM_OTHER_CONTEXT */
++  LWIP_MEM_ALLOC_DECL_PROTECT();
+=20
+   if (size =3D=3D 0) {
+     return NULL;
+@@ -464,88 +505,101 @@ mem_malloc(mem_size_t size)
+=20
+   /* protect the heap from concurrent access */
+   sys_arch_sem_wait(mem_sem, 0);
++  LWIP_MEM_ALLOC_PROTECT();
++#if LWIP_ALLOW_MEM_FREE_FROM_OTHER_CONTEXT
++  /* run as long as a mem_free disturbed mem_malloc */
++  do {
++    local_mem_free_count =3D 0;
++#endif /* LWIP_ALLOW_MEM_FREE_FROM_OTHER_CONTEXT */
++
++    /* Scan through the heap searching for a free block that is big enoug=
h,
++     * beginning with the lowest free block.
++     */
++    for (ptr =3D (u8_t *)lfree - ram; ptr < MEM_SIZE_ALIGNED - size;
++         ptr =3D ((struct mem *)&ram[ptr])->next) {
++      mem =3D (struct mem *)&ram[ptr];
++#if LWIP_ALLOW_MEM_FREE_FROM_OTHER_CONTEXT
++      mem_free_count =3D 0;
++      LWIP_MEM_ALLOC_UNPROTECT();
++      /* allow mem_free to run */
++      LWIP_MEM_ALLOC_PROTECT();
++      if (mem_free_count !=3D 0) {
++        local_mem_free_count =3D mem_free_count;
++      }
++      mem_free_count =3D 0;
++#endif /* LWIP_ALLOW_MEM_FREE_FROM_OTHER_CONTEXT */
+=20
+-  /* Scan through the heap searching for a free block that is big enough,
+-   * beginning with the lowest free block.
+-   */
+-  for (ptr =3D (u8_t *)lfree - ram; ptr < MEM_SIZE_ALIGNED - size;
+-       ptr =3D ((struct mem *)&ram[ptr])->next) {
+-    mem =3D (struct mem *)&ram[ptr];
+-
+-    if ((!mem->used) &&
+-        (mem->next - (ptr + SIZEOF_STRUCT_MEM)) >=3D size) {
+-      /* mem is not used and at least perfect fit is possible:
+-       * mem->next - (ptr + SIZEOF_STRUCT_MEM) gives us the 'user data si=
ze' of mem */
+-
+-      if (mem->next - (ptr + SIZEOF_STRUCT_MEM) >=3D (size + SIZEOF_STRUC=
T_MEM + MIN_SIZE_ALIGNED)) {
+-        /* (in addition to the above, we test if another struct mem (SIZE=
OF_STRUCT_MEM) containing
+-         * at least MIN_SIZE_ALIGNED of data also fits in the 'user data =
space' of 'mem')
+-         * -> split large block, create empty remainder,
+-         * remainder must be large enough to contain MIN_SIZE_ALIGNED dat=
a: if
+-         * mem->next - (ptr + (2*SIZEOF_STRUCT_MEM)) =3D=3D size,
+-         * struct mem would fit in but no data between mem2 and mem2->nex=
t
+-         * @todo we could leave out MIN_SIZE_ALIGNED. We would create an =
empty
+-         *       region that couldn't hold data, but when mem->next gets =
freed,
+-         *       the 2 regions would be combined, resulting in more free =
memory
+-         */
+-        ptr2 =3D ptr + SIZEOF_STRUCT_MEM + size;
+-        /* create mem2 struct */
+-        mem2 =3D (struct mem *)&ram[ptr2];
+-        mem2->used =3D 0;
+-        mem2->next =3D mem->next;
+-        mem2->prev =3D ptr;
+-        /* and insert it between mem and mem->next */
+-        mem->next =3D ptr2;
+-        mem->used =3D 1;
+-
+-        if (mem2->next !=3D MEM_SIZE_ALIGNED) {
+-          ((struct mem *)&ram[mem2->next])->prev =3D ptr2;
+-        }
+-#if MEM_STATS
+-        lwip_stats.mem.used +=3D (size + SIZEOF_STRUCT_MEM);
+-        if (lwip_stats.mem.max < lwip_stats.mem.used) {
+-          lwip_stats.mem.max =3D lwip_stats.mem.used;
++      if ((!mem->used) &&
++          (mem->next - (ptr + SIZEOF_STRUCT_MEM)) >=3D size) {
++        /* mem is not used and at least perfect fit is possible:
++         * mem->next - (ptr + SIZEOF_STRUCT_MEM) gives us the 'user data =
size' of mem */
++
++        if (mem->next - (ptr + SIZEOF_STRUCT_MEM) >=3D (size + SIZEOF_STR=
UCT_MEM + MIN_SIZE_ALIGNED)) {
++          /* (in addition to the above, we test if another struct mem (SI=
ZEOF_STRUCT_MEM) containing
++           * at least MIN_SIZE_ALIGNED of data also fits in the 'user dat=
a space' of 'mem')
++           * -> split large block, create empty remainder,
++           * remainder must be large enough to contain MIN_SIZE_ALIGNED d=
ata: if
++           * mem->next - (ptr + (2*SIZEOF_STRUCT_MEM)) =3D=3D size,
++           * struct mem would fit in but no data between mem2 and mem2->n=
ext
++           * @todo we could leave out MIN_SIZE_ALIGNED. We would create a=
n empty
++           *       region that couldn't hold data, but when mem->next get=
s freed,
++           *       the 2 regions would be combined, resulting in more fre=
e memory
++           */
++          ptr2 =3D ptr + SIZEOF_STRUCT_MEM + size;
++          /* create mem2 struct */
++          mem2 =3D (struct mem *)&ram[ptr2];
++          mem2->used =3D 0;
++          mem2->next =3D mem->next;
++          mem2->prev =3D ptr;
++          /* and insert it between mem and mem->next */
++          mem->next =3D ptr2;
++          mem->used =3D 1;
++
++          if (mem2->next !=3D MEM_SIZE_ALIGNED) {
++            ((struct mem *)&ram[mem2->next])->prev =3D ptr2;
++          }
++          MEM_STATS_INC_USED(used, (size + SIZEOF_STRUCT_MEM));
++        } else {
++          /* (a mem2 struct does no fit into the user data space of mem a=
nd mem->next will always
++           * be used at this point: if not we have 2 unused structs in a =
row, plug_holes should have
++           * take care of this).
++           * -> near fit or excact fit: do not split, no mem2 creation
++           * also can't move mem->next directly behind mem, since mem->ne=
xt
++           * will always be used at this point!
++           */
++          mem->used =3D 1;
++          MEM_STATS_INC_USED(used, mem->next - ((u8_t *)mem - ram));
+         }
+-#endif /* MEM_STATS */
+-      } else {
+-        /* (a mem2 struct does no fit into the user data space of mem and=
 mem->next will always
+-         * be used at this point: if not we have 2 unused structs in a ro=
w, plug_holes should have
+-         * take care of this).
+-         * -> near fit or excact fit: do not split, no mem2 creation
+-         * also can't move mem->next directly behind mem, since mem->next
+-         * will always be used at this point!
+-         */
+-        mem->used =3D 1;
+-#if MEM_STATS
+-        lwip_stats.mem.used +=3D mem->next - ((u8_t *)mem - ram);
+-        if (lwip_stats.mem.max < lwip_stats.mem.used) {
+-          lwip_stats.mem.max =3D lwip_stats.mem.used;
+-        }
+-#endif /* MEM_STATS */
+-      }
+=20
+-      if (mem =3D=3D lfree) {
+-        /* Find next free block after mem and update lowest free pointer =
*/
+-        while (lfree->used && lfree !=3D ram_end) {
+-          lfree =3D (struct mem *)&ram[lfree->next];
++        if (mem =3D=3D lfree) {
++          /* Find next free block after mem and update lowest free pointe=
r */
++          while (lfree->used && lfree !=3D ram_end) {
++            LWIP_MEM_ALLOC_UNPROTECT();
++            /* prevent high interrupt latency... */
++            LWIP_MEM_ALLOC_PROTECT();
++            lfree =3D (struct mem *)&ram[lfree->next];
++          }
++          LWIP_ASSERT("mem_malloc: !lfree->used", ((lfree =3D=3D ram_end)=
 || (!lfree->used)));
+         }
+-        LWIP_ASSERT("mem_malloc: !lfree->used", ((lfree =3D=3D ram_end) |=
| (!lfree->used)));
+-      }
+-      sys_sem_signal(mem_sem);
+-      LWIP_ASSERT("mem_malloc: allocated memory not above ram_end.",
+-       (mem_ptr_t)mem + SIZEOF_STRUCT_MEM + size <=3D (mem_ptr_t)ram_end)=
;
+-      LWIP_ASSERT("mem_malloc: allocated memory properly aligned.",
+-       (unsigned long)((u8_t *)mem + SIZEOF_STRUCT_MEM) % MEM_ALIGNMENT =
=3D=3D 0);
+-      LWIP_ASSERT("mem_malloc: sanity check alignment",
+-        (((mem_ptr_t)mem) & (MEM_ALIGNMENT-1)) =3D=3D 0);
++        LWIP_MEM_ALLOC_UNPROTECT();
++        sys_sem_signal(mem_sem);
++        LWIP_ASSERT("mem_malloc: allocated memory not above ram_end.",
++         (mem_ptr_t)mem + SIZEOF_STRUCT_MEM + size <=3D (mem_ptr_t)ram_en=
d);
++        LWIP_ASSERT("mem_malloc: allocated memory properly aligned.",
++         (unsigned long)((u8_t *)mem + SIZEOF_STRUCT_MEM) % MEM_ALIGNMENT=
 =3D=3D 0);
++        LWIP_ASSERT("mem_malloc: sanity check alignment",
++          (((mem_ptr_t)mem) & (MEM_ALIGNMENT-1)) =3D=3D 0);
+=20
+-      return (u8_t *)mem + SIZEOF_STRUCT_MEM;
++        return (u8_t *)mem + SIZEOF_STRUCT_MEM;
++      }
+     }
+-  }
++#if LWIP_ALLOW_MEM_FREE_FROM_OTHER_CONTEXT
++    /* if we got interrupted by a mem_free, try again */
++  } while(local_mem_free_count !=3D 0);
++#endif /* LWIP_ALLOW_MEM_FREE_FROM_OTHER_CONTEXT */
+   LWIP_DEBUGF(MEM_DEBUG | 2, ("mem_malloc: could not allocate %"S16_F" by=
tes\n", (s16_t)size));
+-#if MEM_STATS
+-  ++lwip_stats.mem.err;
+-#endif /* MEM_STATS */
++  MEM_STATS_INC(err);
++  LWIP_MEM_ALLOC_UNPROTECT();
+   sys_sem_signal(mem_sem);
+   return NULL;
+ }
+Index: src/core/memp.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/src/core/memp.c,v
+retrieving revision 1.55
+retrieving revision 1.56
+diff -u -p -r1.55 -r1.56
+--- a/src/core/memp.c	25 Nov 2007 10:43:28 -0000	1.55
++++ b/src/core/memp.c	27 Jun 2008 18:37:54 -0000	1.56
+@@ -252,13 +252,12 @@ memp_init(void)
+   struct memp *memp;
+   u16_t i, j;
+=20
+-#if MEMP_STATS
+   for (i =3D 0; i < MEMP_MAX; ++i) {
+-    lwip_stats.memp[i].used =3D lwip_stats.memp[i].max =3D
+-      lwip_stats.memp[i].err =3D 0;
+-    lwip_stats.memp[i].avail =3D memp_num[i];
++    MEMP_STATS_AVAIL(used, i, 0);
++    MEMP_STATS_AVAIL(max, i, 0);
++    MEMP_STATS_AVAIL(err, i, 0);
++    MEMP_STATS_AVAIL(avail, i, memp_num[i]);
+   }
+-#endif /* MEMP_STATS */
+=20
+   memp =3D LWIP_MEM_ALIGN(memp_memory);
+   /* for every pool: */
+@@ -315,20 +314,13 @@ memp_malloc_fn(memp_t type, const char*=20
+     memp->file =3D file;
+     memp->line =3D line;
+ #endif /* MEMP_OVERFLOW_CHECK */
+-#if MEMP_STATS
+-    ++lwip_stats.memp[type].used;
+-    if (lwip_stats.memp[type].used > lwip_stats.memp[type].max) {
+-      lwip_stats.memp[type].max =3D lwip_stats.memp[type].used;
+-    }
+-#endif /* MEMP_STATS */
++    MEMP_STATS_INC_USED(used, type);
+     LWIP_ASSERT("memp_malloc: memp properly aligned",
+                 ((mem_ptr_t)memp % MEM_ALIGNMENT) =3D=3D 0);
+     memp =3D (struct memp*)((u8_t*)memp + MEMP_SIZE);
+   } else {
+     LWIP_DEBUGF(MEMP_DEBUG | 2, ("memp_malloc: out of memory in pool %s\n=
", memp_desc[type]));
+-#if MEMP_STATS
+-    ++lwip_stats.memp[type].err;
+-#endif /* MEMP_STATS */
++    MEMP_STATS_INC(err, type);
+   }
+=20
+   SYS_ARCH_UNPROTECT(old_level);
+@@ -365,9 +357,7 @@ memp_free(memp_t type, void *mem)
+ #endif /* MEMP_OVERFLOW_CHECK >=3D 2 */
+ #endif /* MEMP_OVERFLOW_CHECK */
+=20
+-#if MEMP_STATS
+-  lwip_stats.memp[type].used--;=20
+-#endif /* MEMP_STATS */
++  MEMP_STATS_DEC(used, type);=20
+  =20
+   memp->next =3D memp_tab[type];=20
+   memp_tab[type] =3D memp;
+Index: src/core/netif.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/src/core/netif.c,v
+retrieving revision 1.65
+retrieving revision 1.68
+diff -u -p -r1.65 -r1.68
+--- a/src/core/netif.c	9 Oct 2007 20:00:55 -0000	1.65
++++ b/src/core/netif.c	19 Jun 2008 16:27:18 -0000	1.68
+@@ -45,6 +45,12 @@
+ #include "lwip/snmp.h"
+ #include "lwip/igmp.h"
+ #include "netif/etharp.h"
++#if ENABLE_LOOPBACK
++#include "lwip/sys.h"
++#if LWIP_NETIF_LOOPBACK_MULTITHREADING
++#include "lwip/tcpip.h"
++#endif /* LWIP_NETIF_LOOPBACK_MULTITHREADING */
++#endif /* ENABLE_LOOPBACK */
+=20
+ #if LWIP_NETIF_STATUS_CALLBACK
+ #define NETIF_STATUS_CALLBACK(n) { if (n->status_callback) (n->status_cal=
lback)(n); }
+@@ -106,6 +112,10 @@ netif_add(struct netif *netif, struct ip
+ #if LWIP_IGMP
+   netif->igmp_mac_filter =3D NULL;
+ #endif /* LWIP_IGMP */
++#if ENABLE_LOOPBACK
++  netif->loop_first =3D NULL;
++  netif->loop_last =3D NULL;
++#endif /* ENABLE_LOOPBACK */
+=20
+   /* remember netif specific state information data */
+   netif->state =3D state;
+@@ -114,6 +124,9 @@ netif_add(struct netif *netif, struct ip
+ #if LWIP_NETIF_HWADDRHINT
+   netif->addr_hint =3D NULL;
+ #endif /* LWIP_NETIF_HWADDRHINT*/
++#if ENABLE_LOOPBACK && LWIP_LOOPBACK_MAX_PBUFS
++  netif->loop_cnt_current =3D 0;
++#endif /* ENABLE_LOOPBACK && LWIP_LOOPBACK_MAX_PBUFS */
+=20
+   netif_set_addr(netif, ipaddr, netmask, gw);
+=20
+@@ -493,7 +506,158 @@ u8_t netif_is_link_up(struct netif *neti
+  */
+ void netif_set_link_callback(struct netif *netif, void (* link_callback)(=
struct netif *netif ))
+ {
+-    if ( netif )
+-        netif->link_callback =3D link_callback;
++  if (netif) {
++    netif->link_callback =3D link_callback;
++  }
+ }
+ #endif /* LWIP_NETIF_LINK_CALLBACK */
++
++#if ENABLE_LOOPBACK
++/**
++ * Send an IP packet to be received on the same netif (loopif-like).
++ * The pbuf is simply copied and handed back to netif->input.
++ * In multithreaded mode, this is done directly since netif->input must p=
ut
++ * the packet on a queue.
++ * In callback mode, the packet is put on an internal queue and is fed to
++ * netif->input by netif_poll().
++ *
++ * @param netif the lwip network interface structure
++ * @param p the (IP) packet to 'send'
++ * @param ipaddr the ip address to send the packet to (not used)
++ * @return ERR_OK if the packet has been sent
++ *         ERR_MEM if the pbuf used to copy the packet couldn't be alloca=
ted
++ */
++err_t
++netif_loop_output(struct netif *netif, struct pbuf *p,
++       struct ip_addr *ipaddr)
++{
++  struct pbuf *r;
++  err_t err;
++  struct pbuf *last;
++#if LWIP_LOOPBACK_MAX_PBUFS
++  u8_t clen =3D 0;
++#endif /* LWIP_LOOPBACK_MAX_PBUFS */
++  SYS_ARCH_DECL_PROTECT(lev);
++  LWIP_UNUSED_ARG(ipaddr);
++
++  /* Allocate a new pbuf */
++  r =3D pbuf_alloc(PBUF_LINK, p->tot_len, PBUF_RAM);
++  if (r =3D=3D NULL) {
++    return ERR_MEM;
++  }
++#if LWIP_LOOPBACK_MAX_PBUFS
++  clen =3D pbuf_clen(r);
++  /* check for overflow or too many pbuf on queue */
++  if(((netif->loop_cnt_current + clen) < netif->loop_cnt_current) ||
++    ((netif->loop_cnt_current + clen) > LWIP_LOOPBACK_MAX_PBUFS)) {
++      pbuf_free(r);
++      r =3D NULL;
++      return ERR_MEM;
++  }
++  netif->loop_cnt_current +=3D clen;
++#endif /* LWIP_LOOPBACK_MAX_PBUFS */
++
++  /* Copy the whole pbuf queue p into the single pbuf r */
++  if ((err =3D pbuf_copy(r, p)) !=3D ERR_OK) {
++    pbuf_free(r);
++    r =3D NULL;
++    return err;
++  }
++
++  /* Put the packet on a linked list which gets emptied through calling
++     netif_poll(). */
++
++  /* let last point to the last pbuf in chain r */
++  for (last =3D r; last->next !=3D NULL; last =3D last->next);
++
++  SYS_ARCH_PROTECT(lev);
++  if(netif->loop_first !=3D NULL) {
++    LWIP_ASSERT("if first !=3D NULL, last must also be !=3D NULL", netif-=
>loop_last !=3D NULL);
++    netif->loop_last->next =3D r;
++    netif->loop_last =3D last;
++  } else {
++    netif->loop_first =3D r;
++    netif->loop_last =3D last;
++  }
++  SYS_ARCH_UNPROTECT(lev);
++
++#if LWIP_NETIF_LOOPBACK_MULTITHREADING
++  /* For multithreading environment, schedule a call to netif_poll */
++  tcpip_callback(netif_poll, netif);
++#endif /* LWIP_NETIF_LOOPBACK_MULTITHREADING */
++
++  return ERR_OK;
++}
++
++/**
++ * Call netif_poll() in the main loop of your application. This is to pre=
vent
++ * reentering non-reentrant functions like tcp_input(). Packets passed to
++ * netif_loop_output() are put on a list that is passed to netif->input()=
 by
++ * netif_poll().
++ */
++void
++netif_poll(struct netif *netif)
++{
++  struct pbuf *in;
++  SYS_ARCH_DECL_PROTECT(lev);
++
++  do {
++    /* Get a packet from the list. With SYS_LIGHTWEIGHT_PROT=3D1, this is=
 protected */
++    SYS_ARCH_PROTECT(lev);
++    in =3D netif->loop_first;
++    if(in !=3D NULL) {
++      struct pbuf *in_end =3D in;
++#if LWIP_LOOPBACK_MAX_PBUFS
++      u8_t clen =3D pbuf_clen(in);
++      /* adjust the number of pbufs on queue */
++      LWIP_ASSERT("netif->loop_cnt_current underflow",
++        ((netif->loop_cnt_current - clen) < netif->loop_cnt_current));
++      netif->loop_cnt_current -=3D clen;
++#endif /* LWIP_LOOPBACK_MAX_PBUFS */
++      while(in_end->len !=3D in_end->tot_len) {
++        LWIP_ASSERT("bogus pbuf: len !=3D tot_len but next =3D=3D NULL!",=
 in_end->next !=3D NULL);
++        in_end =3D in_end->next;
++      }
++      /* 'in_end' now points to the last pbuf from 'in' */
++      if(in_end =3D=3D netif->loop_last) {
++        /* this was the last pbuf in the list */
++        netif->loop_first =3D netif->loop_last =3D NULL;
++      } else {
++        /* pop the pbuf off the list */
++        netif->loop_first =3D in_end->next;
++        LWIP_ASSERT("should not be null since first !=3D last!", netif->l=
oop_first !=3D NULL);
++      }
++      /* De-queue the pbuf from its successors on the 'loop_' list. */
++      in_end->next =3D NULL;
++    }
++    SYS_ARCH_UNPROTECT(lev);
++
++    if(in !=3D NULL) {
++      /* loopback packets are always IP packets! */
++      if(ip_input(in, netif) !=3D ERR_OK) {
++        pbuf_free(in);
++      }
++      /* Don't reference the packet any more! */
++      in =3D NULL;
++    }
++  /* go on while there is a packet on the list */
++  } while(netif->loop_first !=3D NULL);
++}
++
++#if !LWIP_NETIF_LOOPBACK_MULTITHREADING
++/**
++ * Calls netif_poll() for every netif on the netif_list.
++ */
++void
++netif_poll_all(void)
++{
++  struct netif *netif =3D netif_list;
++  /* loop through netifs */
++  while (netif !=3D NULL) {
++    netif_poll(netif);
++    /* proceed to next network interface */
++    netif =3D netif->next;
++  }
++}
++#endif /* !LWIP_NETIF_LOOPBACK_MULTITHREADING */
++#endif /* ENABLE_LOOPBACK */
+Index: src/core/pbuf.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/src/core/pbuf.c,v
+retrieving revision 1.127
+retrieving revision 1.128
+diff -u -p -r1.127 -r1.128
+--- a/src/core/pbuf.c	4 Mar 2008 16:37:46 -0000	1.127
++++ b/src/core/pbuf.c	1 Apr 2008 19:05:40 -0000	1.128
+@@ -667,8 +667,8 @@ pbuf_dechain(struct pbuf *p)
+  *
+  * @note Only one packet is copied, no packet queue!
+  *
+- * @param p_to pbuf source of the copy
+- * @param p_from pbuf destination of the copy
++ * @param p_to pbuf destination of the copy
++ * @param p_from pbuf source of the copy
+  *
+  * @return ERR_OK if pbuf was copied
+  *         ERR_ARG if one of the pbufs is NULL or p_to is not big
+Index: src/core/stats.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/src/core/stats.c,v
+retrieving revision 1.27
+retrieving revision 1.28
+diff -u -p -r1.27 -r1.28
+--- a/src/core/stats.c	4 Mar 2008 16:31:32 -0000	1.27
++++ b/src/core/stats.c	27 Jun 2008 18:37:54 -0000	1.28
+@@ -54,7 +54,6 @@ stats_display_proto(struct stats_proto *
+ {
+   LWIP_PLATFORM_DIAG(("\n%s\n\t", name));
+   LWIP_PLATFORM_DIAG(("xmit: %"STAT_COUNTER_F"\n\t", proto->xmit));=20
+-  LWIP_PLATFORM_DIAG(("rexmit: %"STAT_COUNTER_F"\n\t", proto->rexmit));=
=20
+   LWIP_PLATFORM_DIAG(("recv: %"STAT_COUNTER_F"\n\t", proto->recv));=20
+   LWIP_PLATFORM_DIAG(("fw: %"STAT_COUNTER_F"\n\t", proto->fw));=20
+   LWIP_PLATFORM_DIAG(("drop: %"STAT_COUNTER_F"\n\t", proto->drop));=20
+@@ -68,6 +67,7 @@ stats_display_proto(struct stats_proto *
+   LWIP_PLATFORM_DIAG(("cachehit: %"STAT_COUNTER_F"\n", proto->cachehit));=
=20
+ }
+=20
++#if IGMP_STATS
+ void
+ stats_display_igmp(struct stats_igmp *igmp)
+ {
+@@ -82,7 +82,9 @@ stats_display_igmp(struct stats_igmp *ig
+   LWIP_PLATFORM_DIAG(("report_rxed: %"STAT_COUNTER_F"\n\t", igmp->report_=
rxed));=20
+   LWIP_PLATFORM_DIAG(("group_query_rxed: %"STAT_COUNTER_F"\n", igmp->grou=
p_query_rxed));
+ }
++#endif /* IGMP_STATS */
+=20
++#if MEM_STATS || MEMP_STATS
+ void
+ stats_display_mem(struct stats_mem *mem, char *name)
+ {
+@@ -93,48 +95,53 @@ stats_display_mem(struct stats_mem *mem,
+   LWIP_PLATFORM_DIAG(("err: %"U32_F"\n", (u32_t)mem->err));
+ }
+=20
++#if MEMP_STATS
+ void
+-stats_display(void)
++stats_display_memp(struct stats_mem *mem, int index)
+ {
+-#if MEMP_STATS
+-  s16_t i;
+   char * memp_names[] =3D {
+ #define LWIP_MEMPOOL(name,num,size,desc) desc,
+ #include "lwip/memp_std.h"
+   };
+-#endif
+-#if LINK_STATS
+-  stats_display_proto(&lwip_stats.link, "LINK");
+-#endif
+-#if ETHARP_STATS
+-  stats_display_proto(&lwip_stats.etharp, "ETHARP");
+-#endif
+-#if IPFRAG_STATS
+-  stats_display_proto(&lwip_stats.ip_frag, "IP_FRAG");
+-#endif
+-#if IP_STATS
+-  stats_display_proto(&lwip_stats.ip, "IP");
+-#endif
+-#if ICMP_STATS
+-  stats_display_proto(&lwip_stats.icmp, "ICMP");
+-#endif
+-#if IGMP_STATS
+-  stats_display_igmp(&lwip_stats.igmp);
+-#endif
+-#if UDP_STATS
+-  stats_display_proto(&lwip_stats.udp, "UDP");
+-#endif
+-#if TCP_STATS
+-  stats_display_proto(&lwip_stats.tcp, "TCP");
+-#endif
+-#if MEM_STATS
+-  stats_display_mem(&lwip_stats.mem, "HEAP");
+-#endif
+-#if MEMP_STATS
++  if(index < MEMP_MAX) {
++    stats_display_mem(mem, memp_names[index]);
++  }
++}
++#endif /* MEMP_STATS */
++#endif /* MEM_STATS || MEMP_STATS */
++
++#if SYS_STATS
++void
++stats_display_sys(struct stats_sys *sys)
++{
++  LWIP_PLATFORM_DIAG(("\nSYS\n\t"));
++  LWIP_PLATFORM_DIAG(("sem.used: %"U32_F"\n\t", (u32_t)sys->sem.used));=
=20
++  LWIP_PLATFORM_DIAG(("sem.max:  %"U32_F"\n\t", (u32_t)sys->sem.max));=20
++  LWIP_PLATFORM_DIAG(("sem.err:  %"U32_F"\n\t", (u32_t)sys->sem.err));=20
++  LWIP_PLATFORM_DIAG(("mbox.used: %"U32_F"\n\t", (u32_t)sys->mbox.used));=
=20
++  LWIP_PLATFORM_DIAG(("mbox.max:  %"U32_F"\n\t", (u32_t)sys->mbox.max));=
=20
++  LWIP_PLATFORM_DIAG(("mbox.err:  %"U32_F"\n\t", (u32_t)sys->mbox.err));=
=20
++}
++#endif /* SYS_STATS */
++
++void
++stats_display(void)
++{
++  s16_t i;
++
++  LINK_STATS_DISPLAY();
++  ETHARP_STATS_DISPLAY();
++  IPFRAG_STATS_DISPLAY();
++  IP_STATS_DISPLAY();
++  IGMP_STATS_DISPLAY();
++  ICMP_STATS_DISPLAY();
++  UDP_STATS_DISPLAY();
++  TCP_STATS_DISPLAY();
++  MEM_STATS_DISPLAY();
+   for (i =3D 0; i < MEMP_MAX; i++) {
+-    stats_display_mem(&lwip_stats.memp[i], memp_names[i]);
++    MEMP_STATS_DISPLAY(i);
+   }
+-#endif
++  SYS_STATS_DISPLAY();
+ }
+ #endif /* LWIP_STATS_DISPLAY */
+=20
+Index: src/core/sys.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/src/core/sys.c,v
+retrieving revision 1.32
+retrieving revision 1.33
+diff -u -p -r1.32 -r1.33
+--- a/src/core/sys.c	25 Nov 2007 13:57:05 -0000	1.32
++++ b/src/core/sys.c	16 Jul 2008 20:36:12 -0000	1.33
+@@ -65,7 +65,7 @@ struct sswt_cb
+ void
+ sys_mbox_fetch(sys_mbox_t mbox, void **msg)
+ {
+-  u32_t time;
++  u32_t time_needed;
+   struct sys_timeouts *timeouts;
+   struct sys_timeo *tmptimeout;
+   sys_timeout_handler h;
+@@ -76,18 +76,18 @@ sys_mbox_fetch(sys_mbox_t mbox, void **m
+=20
+   if (!timeouts || !timeouts->next) {
+     UNLOCK_TCPIP_CORE();
+-    time =3D sys_arch_mbox_fetch(mbox, msg, 0);
++    time_needed =3D sys_arch_mbox_fetch(mbox, msg, 0);
+     LOCK_TCPIP_CORE();
+   } else {
+     if (timeouts->next->time > 0) {
+       UNLOCK_TCPIP_CORE();
+-      time =3D sys_arch_mbox_fetch(mbox, msg, timeouts->next->time);
++      time_needed =3D sys_arch_mbox_fetch(mbox, msg, timeouts->next->time=
);
+       LOCK_TCPIP_CORE();
+     } else {
+-      time =3D SYS_ARCH_TIMEOUT;
++      time_needed =3D SYS_ARCH_TIMEOUT;
+     }
+=20
+-    if (time =3D=3D SYS_ARCH_TIMEOUT) {
++    if (time_needed =3D=3D SYS_ARCH_TIMEOUT) {
+       /* If time =3D=3D SYS_ARCH_TIMEOUT, a timeout occured before a mess=
age
+          could be fetched. We should now call the timeout handler and
+          deallocate the memory allocated for the timeout. */
+@@ -107,8 +107,8 @@ sys_mbox_fetch(sys_mbox_t mbox, void **m
+       /* If time !=3D SYS_ARCH_TIMEOUT, a message was received before the=
 timeout
+          occured. The time variable is set to the number of
+          milliseconds we waited for the message. */
+-      if (time < timeouts->next->time) {
+-        timeouts->next->time -=3D time;
++      if (time_needed < timeouts->next->time) {
++        timeouts->next->time -=3D time_needed;
+       } else {
+         timeouts->next->time =3D 0;
+       }
+@@ -125,7 +125,7 @@ sys_mbox_fetch(sys_mbox_t mbox, void **m
+ void
+ sys_sem_wait(sys_sem_t sem)
+ {
+-  u32_t time;
++  u32_t time_needed;
+   struct sys_timeouts *timeouts;
+   struct sys_timeo *tmptimeout;
+   sys_timeout_handler h;
+@@ -139,12 +139,12 @@ sys_sem_wait(sys_sem_t sem)
+     sys_arch_sem_wait(sem, 0);
+   } else {
+     if (timeouts->next->time > 0) {
+-      time =3D sys_arch_sem_wait(sem, timeouts->next->time);
++      time_needed =3D sys_arch_sem_wait(sem, timeouts->next->time);
+     } else {
+-      time =3D SYS_ARCH_TIMEOUT;
++      time_needed =3D SYS_ARCH_TIMEOUT;
+     }
+=20
+-    if (time =3D=3D SYS_ARCH_TIMEOUT) {
++    if (time_needed =3D=3D SYS_ARCH_TIMEOUT) {
+       /* If time =3D=3D SYS_ARCH_TIMEOUT, a timeout occured before a mess=
age
+         could be fetched. We should now call the timeout handler and
+         deallocate the memory allocated for the timeout. */
+@@ -164,8 +164,8 @@ sys_sem_wait(sys_sem_t sem)
+       /* If time !=3D SYS_ARCH_TIMEOUT, a message was received before the=
 timeout
+          occured. The time variable is set to the number of
+          milliseconds we waited for the message. */
+-      if (time < timeouts->next->time) {
+-        timeouts->next->time -=3D time;
++      if (time_needed < timeouts->next->time) {
++        timeouts->next->time -=3D time_needed;
+       } else {
+         timeouts->next->time =3D 0;
+       }
+Index: src/core/tcp.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/src/core/tcp.c,v
+retrieving revision 1.85
+retrieving revision 1.86
+diff -u -p -r1.85 -r1.86
+--- a/src/core/tcp.c	22 Jan 2008 21:15:15 -0000	1.85
++++ b/src/core/tcp.c	26 Mar 2008 11:57:13 -0000	1.86
+@@ -509,7 +509,8 @@ tcp_connect(struct tcp_pcb *pcb, struct=20
+   pcb->rcv_wnd =3D TCP_WND;
+   pcb->rcv_ann_wnd =3D TCP_WND;
+   pcb->snd_wnd =3D TCP_WND;
+-  /* The send MSS is updated when an MSS option is received. */
++  /* As initial send MSS, we use TCP_MSS but limit it to 536.
++     The send MSS is updated when an MSS option is received. */
+   pcb->mss =3D (TCP_MSS > 536) ? 536 : TCP_MSS;
+ #if TCP_CALCULATE_EFF_SEND_MSS
+   pcb->mss =3D tcp_eff_send_mss(pcb->mss, ipaddr);
+@@ -991,7 +992,8 @@ tcp_alloc(u8_t prio)
+     pcb->rcv_ann_wnd =3D TCP_WND;
+     pcb->tos =3D 0;
+     pcb->ttl =3D TCP_TTL;
+-    /* The send MSS is updated when an MSS option is received. */
++    /* As initial send MSS, we use TCP_MSS but limit it to 536.
++       The send MSS is updated when an MSS option is received. */
+     pcb->mss =3D (TCP_MSS > 536) ? 536 : TCP_MSS;
+     pcb->rto =3D 3000 / TCP_SLOW_INTERVAL;
+     pcb->sa =3D 0;
+Index: src/core/tcp_in.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/src/core/tcp_in.c,v
+retrieving revision 1.97
+retrieving revision 1.100
+diff -u -p -r1.97 -r1.100
+--- a/src/core/tcp_in.c	22 Jan 2008 21:15:15 -0000	1.97
++++ b/src/core/tcp_in.c	24 Jun 2008 15:46:39 -0000	1.100
+@@ -511,7 +511,7 @@ tcp_process(struct tcp_pcb *pcb)
+       }
+     } else {
+       if (TCP_SEQ_BETWEEN(seqno, pcb->rcv_nxt,=20
+-                          pcb->rcv_nxt+pcb->rcv_ann_wnd)) {
++                          pcb->rcv_nxt+pcb->rcv_wnd)) {
+         acceptable =3D 1;
+       }
+     }
+@@ -1038,7 +1038,7 @@ tcp_receive(struct tcp_pcb *pcb)
+        and below rcv_nxt + rcv_wnd) in order to be further
+        processed. */
+     if (TCP_SEQ_BETWEEN(seqno, pcb->rcv_nxt,=20
+-                        pcb->rcv_nxt + pcb->rcv_ann_wnd - 1)){
++                        pcb->rcv_nxt + pcb->rcv_wnd - 1)){
+       if (pcb->rcv_nxt =3D=3D seqno) {
+         accepted_inseq =3D 1;=20
+         /* The incoming segment is the next in sequence. We check if
+@@ -1195,14 +1195,14 @@ tcp_receive(struct tcp_pcb *pcb)
+                   } else {
+                     pcb->ooseq =3D cseg;
+                   }
+-                }
+-                tcp_seg_free(next);
+-                if (cseg->next !=3D NULL) {
+-                  next =3D cseg->next;
+-                  if (TCP_SEQ_GT(seqno + cseg->len, next->tcphdr->seqno))=
 {
+-                    /* We need to trim the incoming segment. */
+-                    cseg->len =3D (u16_t)(next->tcphdr->seqno - seqno);
+-                    pbuf_realloc(cseg->p, cseg->len);
++                  tcp_seg_free(next);
++                  if (cseg->next !=3D NULL) {
++                    next =3D cseg->next;
++                    if (TCP_SEQ_GT(seqno + cseg->len, next->tcphdr->seqno=
)) {
++                      /* We need to trim the incoming segment. */
++                      cseg->len =3D (u16_t)(next->tcphdr->seqno - seqno);
++                      pbuf_realloc(cseg->p, cseg->len);
++                    }
+                   }
+                 }
+                 break;
+@@ -1282,10 +1282,7 @@ tcp_receive(struct tcp_pcb *pcb)
+=20
+       }
+     } else {
+-      if(!TCP_SEQ_BETWEEN(seqno, pcb->rcv_nxt,=20
+-                          pcb->rcv_nxt + pcb->rcv_ann_wnd-1)){
+-        tcp_ack_now(pcb);
+-      }
++      tcp_ack_now(pcb);
+     }
+   } else {
+     /* Segments with length 0 is taken care of here. Segments that
+@@ -1331,7 +1328,8 @@ tcp_parseopt(struct tcp_pcb *pcb)
+         opts[c + 1] =3D=3D 0x04) {
+         /* An MSS option with the right option length. */
+         mss =3D (opts[c + 2] << 8) | opts[c + 3];
+-        pcb->mss =3D mss > TCP_MSS? TCP_MSS: mss;
++        /* Limit the mss to the configured TCP_MSS and prevent division b=
y zero */
++        pcb->mss =3D ((mss > TCP_MSS) || (mss =3D=3D 0)) ? TCP_MSS : mss;
+=20
+         /* And we are done processing options. */
+         break;
+Index: src/core/ipv4/autoip.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/src/core/ipv4/autoip.c,v
+retrieving revision 1.16
+retrieving revision 1.17
+diff -u -p -r1.16 -r1.17
+--- a/src/core/ipv4/autoip.c	26 Jan 2008 16:11:40 -0000	1.16
++++ b/src/core/ipv4/autoip.c	17 Jun 2008 20:16:23 -0000	1.17
+@@ -395,8 +395,8 @@ autoip_arp_reply(struct netif *netif, st
+     /* Copy struct ip_addr2 to aligned ip_addr, to support compilers with=
out
+      * structure packing (not using structure copy which breaks strict-al=
iasing rules).
+      */
+-    MEMCPY(&sipaddr, &hdr->sipaddr, sizeof(sipaddr));
+-    MEMCPY(&dipaddr, &hdr->dipaddr, sizeof(dipaddr));
++    SMEMCPY(&sipaddr, &hdr->sipaddr, sizeof(sipaddr));
++    SMEMCPY(&dipaddr, &hdr->dipaddr, sizeof(dipaddr));
+      =20
+     if ((netif->autoip->state =3D=3D AUTOIP_STATE_PROBING) ||
+         ((netif->autoip->state =3D=3D AUTOIP_STATE_ANNOUNCING) &&
+Index: src/core/ipv4/inet_chksum.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/src/core/ipv4/inet_chksum.c,v
+retrieving revision 1.4
+retrieving revision 1.5
+diff -u -p -r1.4 -r1.5
+--- a/src/core/ipv4/inet_chksum.c	10 Mar 2008 16:12:31 -0000	1.4
++++ b/src/core/ipv4/inet_chksum.c	17 Jun 2008 20:06:25 -0000	1.5
+@@ -41,8 +41,6 @@
+ #include "lwip/inet_chksum.h"
+ #include "lwip/inet.h"
+=20
+-#include <string.h>
+-
+ /* These are some reference implementations of the checksum algorithm, wi=
th the
+  * aim of being simple, correct and fully portable. Checksumming is the
+  * first thing you would want to optimize for your platform. If you creat=
e
+@@ -65,6 +63,11 @@
+ # define LWIP_CHKSUM_ALGORITHM 0
+ #endif
+=20
++/** Like the name says... */
++#define SWAP_BYTES_IN_WORD(w) ((w & 0xff) << 8) | ((w & 0xff00) >> 8)
++/** Split an u32_t in two u16_ts and add them up */
++#define FOLD_U32T(u)          ((u >> 16) + (u & 0x0000ffffUL))
++
+ #if (LWIP_CHKSUM_ALGORITHM =3D=3D 1) /* Version #1 */
+ /**
+  * lwip checksum
+@@ -86,8 +89,7 @@ lwip_standard_chksum(void *dataptr, u16_
+   acc =3D 0;
+   /* dataptr may be at odd or even addresses */
+   octetptr =3D (u8_t*)dataptr;
+-  while (len > 1)
+-  {
++  while (len > 1) {
+     /* declare first octet as most significant
+        thus assume network order, ignoring host order */
+     src =3D (*octetptr) << 8;
+@@ -98,8 +100,7 @@ lwip_standard_chksum(void *dataptr, u16_
+     acc +=3D src;
+     len -=3D 2;
+   }
+-  if (len > 0)
+-  {
++  if (len > 0) {
+     /* accumulate remaining octet */
+     src =3D (*octetptr) << 8;
+     acc +=3D src;
+@@ -154,19 +155,22 @@ lwip_standard_chksum(void *dataptr, int=20
+   }
+=20
+   /* Consume left-over byte, if any */
+-  if (len > 0)
++  if (len > 0) {
+     ((u8_t *)&t)[0] =3D *(u8_t *)ps;;
++  }
+=20
+   /* Add end bytes */
+   sum +=3D t;
+=20
+-  /*  Fold 32-bit sum to 16 bits */
+-  while ((sum >> 16) !=3D 0)
+-    sum =3D (sum & 0xffff) + (sum >> 16);
++  /* Fold 32-bit sum to 16 bits
++     calling this twice is propably faster than if statements... */
++  sum =3D FOLD_U32T(sum);
++  sum =3D FOLD_U32T(sum);
+=20
+   /* Swap if alignment was odd */
+-  if (odd)
+-    sum =3D ((sum & 0xff) << 8) | ((sum & 0xff00) >> 8);
++  if (odd) {
++    sum =3D SWAP_BYTES_IN_WORD(sum);
++  }
+=20
+   return sum;
+ }
+@@ -211,18 +215,20 @@ lwip_standard_chksum(void *dataptr, int=20
+=20
+   while (len > 7)  {
+     tmp =3D sum + *pl++;          /* ping */
+-    if (tmp < sum)
++    if (tmp < sum) {
+       tmp++;                    /* add back carry */
++    }
+=20
+     sum =3D tmp + *pl++;          /* pong */
+-    if (sum < tmp)
++    if (sum < tmp) {
+       sum++;                    /* add back carry */
++    }
+=20
+     len -=3D 8;
+   }
+=20
+   /* make room in upper bits */
+-  sum =3D (sum >> 16) + (sum & 0xffff);
++  sum =3D FOLD_U32T(sum);
+=20
+   ps =3D (u16_t *)pl;
+=20
+@@ -233,16 +239,20 @@ lwip_standard_chksum(void *dataptr, int=20
+   }
+=20
+   /* dangling tail byte remaining? */
+-  if (len > 0)                  /* include odd byte */
++  if (len > 0) {                /* include odd byte */
+     ((u8_t *)&t)[0] =3D *(u8_t *)ps;
++  }
+=20
+   sum +=3D t;                     /* add end bytes */
+=20
+-  while ((sum >> 16) !=3D 0)      /* combine halves */
+-    sum =3D (sum >> 16) + (sum & 0xffff);
++  /* Fold 32-bit sum to 16 bits
++     calling this twice is propably faster than if statements... */
++  sum =3D FOLD_U32T(sum);
++  sum =3D FOLD_U32T(sum);
+=20
+-  if (odd)
+-    sum =3D ((sum & 0xff) << 8) | ((sum & 0xff00) >> 8);
++  if (odd) {
++    sum =3D SWAP_BYTES_IN_WORD(sum);
++  }
+=20
+   return sum;
+ }
+@@ -277,18 +287,18 @@ inet_chksum_pseudo(struct pbuf *p,
+       (void *)q, (void *)q->next));
+     acc +=3D LWIP_CHKSUM(q->payload, q->len);
+     /*LWIP_DEBUGF(INET_DEBUG, ("inet_chksum_pseudo(): unwrapped lwip_chks=
um()=3D%"X32_F" \n", acc));*/
+-    while ((acc >> 16) !=3D 0) {
+-      acc =3D (acc & 0xffffUL) + (acc >> 16);
+-    }
++    /* just executing this next line is probably faster that the if state=
ment needed
++       to check whether we really need to execute it, and does no harm */
++    acc =3D FOLD_U32T(acc);
+     if (q->len % 2 !=3D 0) {
+       swapped =3D 1 - swapped;
+-      acc =3D ((acc & 0xff) << 8) | ((acc & 0xff00UL) >> 8);
++      acc =3D SWAP_BYTES_IN_WORD(acc);
+     }
+     /*LWIP_DEBUGF(INET_DEBUG, ("inet_chksum_pseudo(): wrapped lwip_chksum=
()=3D%"X32_F" \n", acc));*/
+   }
+=20
+   if (swapped) {
+-    acc =3D ((acc & 0xff) << 8) | ((acc & 0xff00UL) >> 8);
++    acc =3D SWAP_BYTES_IN_WORD(acc);
+   }
+   acc +=3D (src->addr & 0xffffUL);
+   acc +=3D ((src->addr >> 16) & 0xffffUL);
+@@ -297,9 +307,10 @@ inet_chksum_pseudo(struct pbuf *p,
+   acc +=3D (u32_t)htons((u16_t)proto);
+   acc +=3D (u32_t)htons(proto_len);
+=20
+-  while ((acc >> 16) !=3D 0) {
+-    acc =3D (acc & 0xffffUL) + (acc >> 16);
+-  }
++  /* Fold 32-bit sum to 16 bits
++     calling this twice is propably faster than if statements... */
++  acc =3D FOLD_U32T(acc);
++  acc =3D FOLD_U32T(acc);
+   LWIP_DEBUGF(INET_DEBUG, ("inet_chksum_pseudo(): pbuf chain lwip_chksum(=
)=3D%"X32_F"\n", acc));
+   return (u16_t)~(acc & 0xffffUL);
+ }
+@@ -340,18 +351,17 @@ inet_chksum_pseudo_partial(struct pbuf *
+     chksum_len -=3D chklen;
+     LWIP_ASSERT("delete me", chksum_len < 0x7fff);
+     /*LWIP_DEBUGF(INET_DEBUG, ("inet_chksum_pseudo(): unwrapped lwip_chks=
um()=3D%"X32_F" \n", acc));*/
+-    while ((acc >> 16) !=3D 0) {
+-      acc =3D (acc & 0xffffUL) + (acc >> 16);
+-    }
++    /* fold the upper bit down */
++    acc =3D FOLD_U32T(acc);
+     if (q->len % 2 !=3D 0) {
+       swapped =3D 1 - swapped;
+-      acc =3D ((acc & 0xff) << 8) | ((acc & 0xff00UL) >> 8);
++      acc =3D SWAP_BYTES_IN_WORD(acc);
+     }
+     /*LWIP_DEBUGF(INET_DEBUG, ("inet_chksum_pseudo(): wrapped lwip_chksum=
()=3D%"X32_F" \n", acc));*/
+   }
+=20
+   if (swapped) {
+-    acc =3D ((acc & 0xff) << 8) | ((acc & 0xff00UL) >> 8);
++    acc =3D SWAP_BYTES_IN_WORD(acc);
+   }
+   acc +=3D (src->addr & 0xffffUL);
+   acc +=3D ((src->addr >> 16) & 0xffffUL);
+@@ -360,9 +370,10 @@ inet_chksum_pseudo_partial(struct pbuf *
+   acc +=3D (u32_t)htons((u16_t)proto);
+   acc +=3D (u32_t)htons(proto_len);
+=20
+-  while ((acc >> 16) !=3D 0) {
+-    acc =3D (acc & 0xffffUL) + (acc >> 16);
+-  }
++  /* Fold 32-bit sum to 16 bits
++     calling this twice is propably faster than if statements... */
++  acc =3D FOLD_U32T(acc);
++  acc =3D FOLD_U32T(acc);
+   LWIP_DEBUGF(INET_DEBUG, ("inet_chksum_pseudo(): pbuf chain lwip_chksum(=
)=3D%"X32_F"\n", acc));
+   return (u16_t)~(acc & 0xffffUL);
+ }
+@@ -380,13 +391,7 @@ inet_chksum_pseudo_partial(struct pbuf *
+ u16_t
+ inet_chksum(void *dataptr, u16_t len)
+ {
+-  u32_t acc;
+-
+-  acc =3D LWIP_CHKSUM(dataptr, len);
+-  while ((acc >> 16) !=3D 0) {
+-    acc =3D (acc & 0xffff) + (acc >> 16);
+-  }
+-  return (u16_t)~(acc & 0xffff);
++  return ~LWIP_CHKSUM(dataptr, len);
+ }
+=20
+ /**
+@@ -407,17 +412,15 @@ inet_chksum_pbuf(struct pbuf *p)
+   swapped =3D 0;
+   for(q =3D p; q !=3D NULL; q =3D q->next) {
+     acc +=3D LWIP_CHKSUM(q->payload, q->len);
+-    while ((acc >> 16) !=3D 0) {
+-      acc =3D (acc & 0xffffUL) + (acc >> 16);
+-    }
++    acc =3D FOLD_U32T(acc);
+     if (q->len % 2 !=3D 0) {
+       swapped =3D 1 - swapped;
+-      acc =3D (acc & 0x00ffUL << 8) | (acc & 0xff00UL >> 8);
++      acc =3D SWAP_BYTES_IN_WORD(acc);
+     }
+   }
+=20
+   if (swapped) {
+-    acc =3D ((acc & 0x00ffUL) << 8) | ((acc & 0xff00UL) >> 8);
++    acc =3D SWAP_BYTES_IN_WORD(acc);
+   }
+   return (u16_t)~(acc & 0xffffUL);
+ }
+Index: src/core/ipv4/ip.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/src/core/ipv4/ip.c,v
+retrieving revision 1.66
+retrieving revision 1.68
+diff -u -p -r1.66 -r1.68
+--- a/src/core/ipv4/ip.c	14 Jan 2008 20:53:23 -0000	1.66
++++ b/src/core/ipv4/ip.c	17 Jun 2008 19:39:22 -0000	1.68
+@@ -531,9 +531,19 @@ ip_output_if(struct pbuf *p, struct ip_a
+   LWIP_DEBUGF(IP_DEBUG, ("ip_output_if: %c%c%"U16_F"\n", netif->name[0], =
netif->name[1], netif->num));
+   ip_debug_print(p);
+=20
+-  LWIP_DEBUGF(IP_DEBUG, ("netif->output()"));
++#if (LWIP_NETIF_LOOPBACK || LWIP_HAVE_LOOPIF)
++  if (ip_addr_cmp(dest, &netif->ip_addr)) {
++    /* Packet to self, enqueue it for loopback */
++    LWIP_DEBUGF(IP_DEBUG, ("netif_loop_output()"));
++
++    return netif_loop_output(netif, p, dest);
++  } else
++#endif /* (LWIP_NETIF_LOOPBACK || LWIP_HAVE_LOOPIF) */
++  {
++    LWIP_DEBUGF(IP_DEBUG, ("netif->output()"));
+=20
+-  return netif->output(netif, p, dest);
++    return netif->output(netif, p, dest);
++  }
+ }
+=20
+ /**
+Index: src/include/lwip/debug.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/src/include/lwip/debug.h,v
+retrieving revision 1.37
+retrieving revision 1.39
+diff -u -p -r1.37 -r1.39
+--- a/src/include/lwip/debug.h	22 Sep 2007 11:16:07 -0000	1.37
++++ b/src/include/lwip/debug.h	16 Jul 2008 20:36:22 -0000	1.39
+@@ -61,26 +61,28 @@
+ #define LWIP_DBG_HALT          0x08U
+=20
+ #ifndef LWIP_NOASSERT
+-#define LWIP_ASSERT(x,y) do { if(!(y)) LWIP_PLATFORM_ASSERT(x); } while(0=
)
++#define LWIP_ASSERT(message, assertion) do { if(!(assertion)) \
++  LWIP_PLATFORM_ASSERT(message); } while(0)
+ #else  /* LWIP_NOASSERT */
+-#define LWIP_ASSERT(x,y)=20
++#define LWIP_ASSERT(message, assertion)=20
+ #endif /* LWIP_NOASSERT */
+=20
+-/** print "m" message only if "e" is true, and execute "h" expression */
++/** if "expression" isn't true, then print "message" and execute "handler=
" expression */
+ #ifndef LWIP_ERROR
+-#define LWIP_ERROR(m,e,h) do { if (!(e)) { LWIP_PLATFORM_ASSERT(m); h;}} =
while(0)
++#define LWIP_ERROR(message, expression, handler) do { if (!(expression)) =
{ \
++  LWIP_PLATFORM_ASSERT(message); handler;}} while(0)
+ #endif /* LWIP_ERROR */
+=20
+ #ifdef LWIP_DEBUG
+ /** print debug message only if debug message type is enabled...
+  *  AND is of correct type AND is at least LWIP_DBG_LEVEL
+  */
+-#define LWIP_DEBUGF(debug,x) do { \
++#define LWIP_DEBUGF(debug, message) do { \
+                                if ( \
+                                    ((debug) & LWIP_DBG_ON) && \
+                                    ((debug) & LWIP_DBG_TYPES_ON) && \
+                                    ((s16_t)((debug) & LWIP_DBG_MASK_LEVEL=
) >=3D LWIP_DBG_MIN_LEVEL)) { \
+-                                 LWIP_PLATFORM_DIAG(x); \
++                                 LWIP_PLATFORM_DIAG(message); \
+                                  if ((debug) & LWIP_DBG_HALT) { \
+                                    while(1); \
+                                  } \
+@@ -88,7 +90,7 @@
+                              } while(0)
+=20
+ #else  /* LWIP_DEBUG */
+-#define LWIP_DEBUGF(debug,x)=20
++#define LWIP_DEBUGF(debug, message)=20
+ #endif /* LWIP_DEBUG */
+=20
+ #endif /* __LWIP_DEBUG_H__ */
+Index: src/include/lwip/err.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/src/include/lwip/err.h,v
+retrieving revision 1.13
+retrieving revision 1.15
+diff -u -p -r1.13 -r1.15
+--- a/src/include/lwip/err.h	13 Dec 2007 23:06:50 -0000	1.13
++++ b/src/include/lwip/err.h	17 Jun 2008 20:27:32 -0000	1.15
+@@ -33,37 +33,43 @@
+ #define __LWIP_ERR_H__
+=20
+ #include "lwip/opt.h"
++#include "lwip/arch.h"
+=20
+ #ifdef __cplusplus
+ extern "C" {
+ #endif
+=20
+-typedef s8_t err_t;
++/** Define LWIP_ERR_T in cc.h if you want to use
++ *  a different type for your platform (must be signed). */
++#ifdef LWIP_ERR_T
++typedef LWIP_ERR_T err_t;
++#else /* LWIP_ERR_T */
++ typedef s8_t err_t;
++#endif /* LWIP_ERR_T*/
+=20
+ /* Definitions for error constants. */
+=20
+ #define ERR_OK          0    /* No error, everything OK. */
+ #define ERR_MEM        -1    /* Out of memory error.     */
+ #define ERR_BUF        -2    /* Buffer error.            */
+-#define ERR_RTE        -3    /* Routing problem.         */
++#define ERR_TIMEOUT    -3    /* Timeout.                 */
++#define ERR_RTE        -4    /* Routing problem.         */
+=20
+ #define ERR_IS_FATAL(e) ((e) < ERR_RTE)
+=20
+-#define ERR_ABRT       -4    /* Connection aborted.      */
+-#define ERR_RST        -5    /* Connection reset.        */
+-#define ERR_CLSD       -6    /* Connection closed.       */
+-#define ERR_CONN       -7    /* Not connected.           */
++#define ERR_ABRT       -5    /* Connection aborted.      */
++#define ERR_RST        -6    /* Connection reset.        */
++#define ERR_CLSD       -7    /* Connection closed.       */
++#define ERR_CONN       -8    /* Not connected.           */
+=20
+-#define ERR_VAL        -8    /* Illegal value.           */
++#define ERR_VAL        -9    /* Illegal value.           */
+=20
+-#define ERR_ARG        -9    /* Illegal argument.        */
++#define ERR_ARG        -10   /* Illegal argument.        */
+=20
+-#define ERR_USE        -10   /* Address in use.          */
++#define ERR_USE        -11   /* Address in use.          */
+=20
+-#define ERR_IF         -11   /* Low-level netif error    */
+-#define ERR_ISCONN     -12   /* Already connected.       */
+-
+-#define ERR_TIMEOUT    -13   /* Timeout.                 */
++#define ERR_IF         -12   /* Low-level netif error    */
++#define ERR_ISCONN     -13   /* Already connected.       */
+=20
+ #define ERR_INPROGRESS -14   /* Operation in progress    */
+=20
+Index: src/include/lwip/mem.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/src/include/lwip/mem.h,v
+retrieving revision 1.21
+retrieving revision 1.22
+diff -u -p -r1.21 -r1.22
+--- a/src/include/lwip/mem.h	4 Mar 2008 16:31:32 -0000	1.21
++++ b/src/include/lwip/mem.h	30 May 2008 11:37:15 -0000	1.22
+@@ -50,16 +50,16 @@ typedef size_t mem_size_t;
+  * allow these defines to be overridden.
+  */
+ #ifndef mem_free
+-#define mem_free(x) free(x)
++#define mem_free free
+ #endif
+ #ifndef mem_malloc
+-#define mem_malloc(x) malloc(x)
++#define mem_malloc malloc
+ #endif
+ #ifndef mem_calloc
+-#define mem_calloc(x, y) calloc(x, y)
++#define mem_calloc calloc
+ #endif
+ #ifndef mem_realloc
+-#define mem_realloc(x, size) (x)
++#define mem_realloc realloc
+ #endif
+ #else /* MEM_LIBC_MALLOC */
+=20
+Index: src/include/lwip/netif.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/src/include/lwip/netif.h,v
+retrieving revision 1.43
+retrieving revision 1.46
+diff -u -p -r1.43 -r1.46
+--- a/src/include/lwip/netif.h	9 Oct 2007 19:59:59 -0000	1.43
++++ b/src/include/lwip/netif.h	19 Jun 2008 16:27:23 -0000	1.46
+@@ -34,6 +34,8 @@
+=20
+ #include "lwip/opt.h"
+=20
++#define ENABLE_LOOPBACK (LWIP_NETIF_LOOPBACK || LWIP_HAVE_LOOPIF)
++
+ #include "lwip/err.h"
+=20
+ #include "lwip/ip_addr.h"
+@@ -165,6 +167,14 @@ struct netif {
+ #if LWIP_NETIF_HWADDRHINT
+   u8_t *addr_hint;
+ #endif /* LWIP_NETIF_HWADDRHINT */
++#if ENABLE_LOOPBACK
++  /* List of packets to be queued for ourselves. */
++  struct pbuf *loop_first;
++  struct pbuf *loop_last;
++#if LWIP_LOOPBACK_MAX_PBUFS
++  u16_t loop_cnt_current;
++#endif /* LWIP_LOOPBACK_MAX_PBUFS */
++#endif /* ENABLE_LOOPBACK */
+ };
+=20
+ #if LWIP_SNMP
+@@ -242,4 +252,12 @@ void netif_set_link_callback(struct neti
+ }
+ #endif
+=20
++#if ENABLE_LOOPBACK
++err_t netif_loop_output(struct netif *netif, struct pbuf *p, struct ip_ad=
dr *dest_ip);
++void netif_poll(struct netif *netif);
++#if !LWIP_NETIF_LOOPBACK_MULTITHREADING
++void netif_poll_all(void);
++#endif /* !LWIP_NETIF_LOOPBACK_MULTITHREADING */
++#endif /* ENABLE_LOOPBACK */
++
+ #endif /* __LWIP_NETIF_H__ */
+Index: src/include/lwip/opt.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/src/include/lwip/opt.h,v
+retrieving revision 1.116
+retrieving revision 1.122
+diff -u -p -r1.116 -r1.122
+--- a/src/include/lwip/opt.h	31 Jan 2008 18:19:29 -0000	1.116
++++ b/src/include/lwip/opt.h	30 Jun 2008 18:16:52 -0000	1.122
+@@ -155,6 +155,27 @@
+ #define MEMP_USE_CUSTOM_POOLS           0
+ #endif
+=20
++/**
++ * Set this to 1 if you want to free PBUF_RAM pbufs (or call mem_free()) =
from
++ * interrupt context (or another context that doesn't allow waiting for a
++ * semaphore).
++ * If set to 1, mem_malloc will be protected by a semaphore and SYS_ARCH_=
PROTECT,
++ * while mem_free will only use SYS_ARCH_PROTECT. mem_malloc SYS_ARCH_UNP=
ROTECTs
++ * with each loop so that mem_free can run.
++ *
++ * ATTENTION: As you can see from the above description, this leads to di=
s-/
++ * enabling interrupts often, which can be slow! Also, on low memory, mem=
_malloc
++ * can need longer.
++ *
++ * If you don't want that, at least for NO_SYS=3D0, you can still use the=
 following
++ * functions to enqueue a deallocation call which then runs in the tcpip_=
thread
++ * context:
++ * - pbuf_free_callback(p);
++ * - mem_free_callback(m);
++ */
++#ifndef LWIP_ALLOW_MEM_FREE_FROM_OTHER_CONTEXT
++#define LWIP_ALLOW_MEM_FREE_FROM_OTHER_CONTEXT 0
++#endif
+=20
+ /*
+    ------------------------------------------------
+@@ -815,6 +836,39 @@
+ #define LWIP_NETIF_HWADDRHINT           0
+ #endif
+=20
++/**
++ * LWIP_NETIF_LOOPBACK=3D=3D1: Support sending packets with a destination=
 IP
++ * address equal to the netif IP address, looping them back up the stack.
++ */
++#ifndef LWIP_NETIF_LOOPBACK
++#define LWIP_NETIF_LOOPBACK             0
++#endif
++
++/**
++ * LWIP_LOOPBACK_MAX_PBUFS: Maximum number of pbufs on queue for loopback
++ * sending for each netif (0 =3D disabled)
++ */
++#ifndef LWIP_LOOPBACK_MAX_PBUFS
++#define LWIP_LOOPBACK_MAX_PBUFS         0
++#endif
++
++/**
++ * LWIP_NETIF_LOOPBACK_MULTITHREADING: Indicates whether threading is ena=
bled in
++ * the system, as netifs must change how they behave depending on this se=
tting
++ * for the LWIP_NETIF_LOOPBACK option to work.
++ * Setting this is needed to avoid reentering non-reentrant functions lik=
e
++ * tcp_input().
++ *    LWIP_NETIF_LOOPBACK_MULTITHREADING=3D=3D1: Indicates that the user =
is using a
++ *       multithreaded environment like tcpip.c. In this case, netif->inp=
ut()
++ *       is called directly.
++ *    LWIP_NETIF_LOOPBACK_MULTITHREADING=3D=3D0: Indicates a polling (or =
NO_SYS) setup.
++ *       The packets are put on a list and netif_poll() must be called in
++ *       the main application loop.
++ */
++#ifndef LWIP_NETIF_LOOPBACK_MULTITHREADING
++#define LWIP_NETIF_LOOPBACK_MULTITHREADING    (!NO_SYS)
++#endif
++
+ /*
+    ------------------------------------
+    ---------- LOOPIF options ----------
+@@ -827,20 +881,16 @@
+ #define LWIP_HAVE_LOOPIF                0
+ #endif
+=20
++/*
++   ------------------------------------
++   ---------- SLIPIF options ----------
++   ------------------------------------
++*/
+ /**
+- * LWIP_LOOPIF_MULTITHREADING: Indicates whether threading is enabled in
+- * the system, as LOOPIF must change how it behaves depending on this set=
ting.
+- * Setting this is needed to avoid reentering non-reentrant functions lik=
e
+- * tcp_input().
+- *    LWIP_LOOPIF_MULTITHREADING=3D=3D1: Indicates that the user is using=
 a
+- *       multithreaded environment like tcpip.c. In this case, netif->inp=
ut()
+- *       is called directly.
+- *    LWIP_LOOPIF_MULTITHREADING=3D=3D0: Indicates a polling (or NO_SYS) =
setup.
+- *       The packets are put on a list and loopif_poll() must be called i=
n
+- *       the main application loop.
++ * LWIP_HAVE_SLIPIF=3D=3D1: Support slip interface and slipif.c
+  */
+-#ifndef LWIP_LOOPIF_MULTITHREADING
+-#define LWIP_LOOPIF_MULTITHREADING      1
++#ifndef LWIP_HAVE_SLIPIF
++#define LWIP_HAVE_SLIPIF                0
+ #endif
+=20
+ /*
+Index: src/include/lwip/sio.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/src/include/lwip/sio.h,v
+retrieving revision 1.7
+retrieving revision 1.8
+diff -u -p -r1.7 -r1.8
+--- a/src/include/lwip/sio.h	6 Sep 2007 16:43:44 -0000	1.7
++++ b/src/include/lwip/sio.h	27 Mar 2008 18:06:02 -0000	1.8
+@@ -32,16 +32,24 @@
+  * It needs to be implemented by those platforms which need SLIP or PPP
+  */
+=20
++#ifndef __SIO_H__
++#define __SIO_H__
++
+ #include "lwip/arch.h"
+=20
+ #ifdef __cplusplus
+ extern "C" {
+ #endif
+=20
++/* If you want to define sio_fd_t elsewhere or differently,
++   define this in your cc.h file. */
+ #ifndef __sio_fd_t_defined
+ typedef void * sio_fd_t;
+ #endif
+=20
++/* The following functions can be defined to something else in your cc.h =
file
++   or be implemented in your custom sio.c file. */
++
+ #ifndef sio_open
+ sio_fd_t sio_open(u8_t);
+ #endif
+@@ -69,3 +77,5 @@ void sio_read_abort(sio_fd_t);
+ #ifdef __cplusplus
+ }
+ #endif
++
++#endif /* __SIO_H__ */
+Index: src/include/lwip/sockets.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/src/include/lwip/sockets.h,v
+retrieving revision 1.38
+retrieving revision 1.39
+diff -u -p -r1.38 -r1.39
+--- a/src/include/lwip/sockets.h	2 Dec 2007 15:24:02 -0000	1.38
++++ b/src/include/lwip/sockets.h	26 Apr 2008 10:46:23 -0000	1.39
+@@ -177,7 +177,22 @@ typedef struct ip_mreq {
+ } ip_mreq;
+ #endif /* LWIP_IGMP */
+=20
+-/* Unimplemented for now... */
++/*
++ * The Type of Service provides an indication of the abstract
++ * parameters of the quality of service desired.  These parameters are
++ * to be used to guide the selection of the actual service parameters
++ * when transmitting a datagram through a particular network.  Several
++ * networks offer service precedence, which somehow treats high
++ * precedence traffic as more important than other traffic (generally
++ * by accepting only traffic above a certain precedence at time of high
++ * load).  The major choice is a three way tradeoff between low-delay,
++ * high-reliability, and high-throughput.
++ * The use of the Delay, Throughput, and Reliability indications may
++ * increase the cost (in some sense) of the service.  In many networks
++ * better performance for one of these parameters is coupled with worse
++ * performance on another.  Except for very unusual cases at most two
++ * of these three indications should be set.
++ */
+ #define IPTOS_TOS_MASK          0x1E
+ #define IPTOS_TOS(tos)          ((tos) & IPTOS_TOS_MASK)
+ #define IPTOS_LOWDELAY          0x10
+@@ -187,7 +202,13 @@ typedef struct ip_mreq {
+ #define IPTOS_MINCOST           IPTOS_LOWCOST
+=20
+ /*
+- * Definitions for IP precedence (also in ip_tos) (Unimplemented)
++ * The Network Control precedence designation is intended to be used
++ * within a network only.  The actual use and control of that
++ * designation is up to each network. The Internetwork Control
++ * designation is intended for use by gateway control originators only.
++ * If the actual use of these precedence designations is of concern to
++ * a particular network, it is the responsibility of that network to
++ * control the access to, and use of, those precedence designations.
+  */
+ #define IPTOS_PREC_MASK                 0xe0
+ #define IPTOS_PREC(tos)                ((tos) & IPTOS_PREC_MASK)
+Index: src/include/lwip/stats.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/src/include/lwip/stats.h,v
+retrieving revision 1.19
+retrieving revision 1.23
+diff -u -p -r1.19 -r1.23
+--- a/src/include/lwip/stats.h	28 Nov 2007 21:25:07 -0000	1.19
++++ b/src/include/lwip/stats.h	8 Jul 2008 09:15:57 -0000	1.23
+@@ -57,7 +57,6 @@ extern "C" {
+=20
+ struct stats_proto {
+   STAT_COUNTER xmit;             /* Transmitted packets. */
+-  STAT_COUNTER rexmit;           /* Retransmitted packets. */
+   STAT_COUNTER recv;             /* Received packets. */
+   STAT_COUNTER fw;               /* Forwarded packets. */
+   STAT_COUNTER drop;             /* Dropped packets. */
+@@ -87,7 +86,8 @@ struct stats_mem {
+   mem_size_t avail;
+   mem_size_t used;
+   mem_size_t max;
+-  mem_size_t err;
++  STAT_COUNTER err;
++  STAT_COUNTER illegal;
+ };
+=20
+ struct stats_syselem {
+@@ -142,64 +142,138 @@ extern struct stats_ lwip_stats;
+ #define stats_init() /* Compatibility define, not init needed. */
+=20
+ #define STATS_INC(x) ++lwip_stats.x
++#define STATS_DEC(x) --lwip_stats.x
+ #else
+ #define stats_init()
+ #define STATS_INC(x)
++#define STATS_DEC(x)
+ #endif /* LWIP_STATS */
+=20
+ #if TCP_STATS
+ #define TCP_STATS_INC(x) STATS_INC(x)
++#define TCP_STATS_DISPLAY() stats_display_proto(&lwip_stats.tcp, "TCP")
+ #else
+ #define TCP_STATS_INC(x)
++#define TCP_STATS_DISPLAY()
+ #endif
+=20
+ #if UDP_STATS
+ #define UDP_STATS_INC(x) STATS_INC(x)
++#define UDP_STATS_DISPLAY() stats_display_proto(&lwip_stats.udp, "UDP")
+ #else
+ #define UDP_STATS_INC(x)
++#define UDP_STATS_DISPLAY()
+ #endif
+=20
+ #if ICMP_STATS
+ #define ICMP_STATS_INC(x) STATS_INC(x)
++#define ICMP_STATS_DISPLAY() stats_display_proto(&lwip_stats.icmp, "ICMP"=
)
+ #else
+ #define ICMP_STATS_INC(x)
++#define ICMP_STATS_DISPLAY()
+ #endif
+=20
+ #if IGMP_STATS
+ #define IGMP_STATS_INC(x) STATS_INC(x)
++#define IGMP_STATS_DISPLAY() stats_display_igmp(&lwip_stats.igmp)
+ #else
+ #define IGMP_STATS_INC(x)
++#define IGMP_STATS_DISPLAY()
+ #endif
+=20
+ #if IP_STATS
+ #define IP_STATS_INC(x) STATS_INC(x)
++#define IP_STATS_DISPLAY() stats_display_proto(&lwip_stats.ip, "IP")
+ #else
+ #define IP_STATS_INC(x)
++#define IP_STATS_DISPLAY()
+ #endif
+=20
+ #if IPFRAG_STATS
+ #define IPFRAG_STATS_INC(x) STATS_INC(x)
++#define IPFRAG_STATS_DISPLAY() stats_display_proto(&lwip_stats.ip_frag, "=
IP_FRAG")
+ #else
+ #define IPFRAG_STATS_INC(x)
++#define IPFRAG_STATS_DISPLAY()
+ #endif
+=20
+ #if ETHARP_STATS
+ #define ETHARP_STATS_INC(x) STATS_INC(x)
++#define ETHARP_STATS_DISPLAY() stats_display_proto(&lwip_stats.etharp, "E=
THARP")
+ #else
+ #define ETHARP_STATS_INC(x)
++#define ETHARP_STATS_DISPLAY()
+ #endif
+=20
+ #if LINK_STATS
+ #define LINK_STATS_INC(x) STATS_INC(x)
++#define LINK_STATS_DISPLAY() stats_display_proto(&lwip_stats.link, "LINK"=
)
+ #else
+ #define LINK_STATS_INC(x)
++#define LINK_STATS_DISPLAY()
++#endif
++
++#if MEM_STATS
++#define MEM_STATS_AVAIL(x, y) lwip_stats.mem.x =3D y
++#define MEM_STATS_INC(x) STATS_INC(mem.x)
++#define MEM_STATS_INC_USED(x, y) do { lwip_stats.mem.used +=3D y; \
++                                    if (lwip_stats.mem.max < lwip_stats.m=
em.used) { \
++                                        lwip_stats.mem.max =3D lwip_stats=
.mem.used; \
++                                    } \
++                                 } while(0)
++#define MEM_STATS_DEC_USED(x, y) lwip_stats.mem.x -=3D y
++#define MEM_STATS_DISPLAY() stats_display_mem(&lwip_stats.mem, "HEAP")
++#else
++#define MEM_STATS_AVAIL(x, y)
++#define MEM_STATS_INC(x)
++#define MEM_STATS_INC_USED(x, y)
++#define MEM_STATS_DEC_USED(x, y)
++#define MEM_STATS_DISPLAY()
++#endif
++
++#if MEMP_STATS
++#define MEMP_STATS_AVAIL(x, i, y) lwip_stats.memp[i].x =3D y
++#define MEMP_STATS_INC(x, i) STATS_INC(memp[i].x)
++#define MEMP_STATS_DEC(x, i) STATS_DEC(memp[i].x)
++#define MEMP_STATS_INC_USED(x, i) do { ++lwip_stats.memp[i].used; \
++                                    if (lwip_stats.memp[i].max < lwip_sta=
ts.memp[i].used) { \
++                                        lwip_stats.memp[i].max =3D lwip_s=
tats.memp[i].used; \
++                                    } \
++                                 } while(0)
++#define MEMP_STATS_DISPLAY(i) stats_display_memp(&lwip_stats.memp[i], i)
++#else
++#define MEMP_STATS_AVAIL(x, i, y)
++#define MEMP_STATS_INC(x, i)
++#define MEMP_STATS_DEC(x, i)
++#define MEMP_STATS_INC_USED(x, i)
++#define MEMP_STATS_DISPLAY(i)
++#endif
++
++#if SYS_STATS
++#define SYS_STATS_INC(x) STATS_INC(sys.x)
++#define SYS_STATS_DEC(x) STATS_DEC(sys.x)
++#define SYS_STATS_DISPLAY() stats_display_sys(&lwip_stats.sys)
++#else
++#define SYS_STATS_INC(x)
++#define SYS_STATS_DEC(x)
++#define SYS_STATS_DISPLAY()
+ #endif
+=20
+ /* Display of statistics */
+ #if LWIP_STATS_DISPLAY
+ void stats_display(void);
++void stats_display_proto(struct stats_proto *proto, char *name);
++void stats_display_igmp(struct stats_igmp *igmp);
++void stats_display_mem(struct stats_mem *mem, char *name);
++void stats_display_memp(struct stats_mem *mem, int index);
++void stats_display_sys(struct stats_sys *sys);
+ #else
+ #define stats_display()
++#define stats_display_proto(proto, name)
++#define stats_display_igmp(igmp)
++#define stats_display_mem(mem, name)
++#define stats_display_memp(mem, index)
++#define stats_display_sys(sys)
+ #endif /* LWIP_STATS_DISPLAY */
+=20
+ #ifdef __cplusplus
+Index: src/include/lwip/tcpip.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/src/include/lwip/tcpip.h,v
+retrieving revision 1.24
+retrieving revision 1.27
+diff -u -p -r1.24 -r1.27
+--- a/src/include/lwip/tcpip.h	12 Jan 2008 11:52:22 -0000	1.24
++++ b/src/include/lwip/tcpip.h	27 Jun 2008 20:34:55 -0000	1.27
+@@ -83,7 +83,11 @@ err_t tcpip_netifapi_lock(struct netifap
+ #endif /* LWIP_NETIF_API */
+=20
+ err_t tcpip_callback_with_block(void (*f)(void *ctx), void *ctx, u8_t blo=
ck);
+-#define tcpip_callback(f,ctx) tcpip_callback_with_block(f,ctx,1)
++#define tcpip_callback(f, ctx)              tcpip_callback_with_block(f, =
ctx, 1)
++
++/* free pbufs or heap memory from another context without blocking */
++err_t pbuf_free_callback(struct pbuf *p);
++err_t mem_free_callback(void *m);
+=20
+ err_t tcpip_timeout(u32_t msecs, sys_timeout_handler h, void *arg);
+ #define tcpip_untimeout(h, arg) tcpip_timeout(0xffffffff, h, arg)
+Index: src/include/netif/loopif.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/src/include/netif/loopif.h,v
+retrieving revision 1.7
+retrieving revision 1.9
+diff -u -p -r1.7 -r1.9
+--- a/src/include/netif/loopif.h	10 May 2007 10:59:20 -0000	1.7
++++ b/src/include/netif/loopif.h	17 Jun 2008 20:12:22 -0000	1.9
+@@ -32,6 +32,7 @@
+ #ifndef __NETIF_LOOPIF_H__
+ #define __NETIF_LOOPIF_H__
+=20
++#include "lwip/opt.h"
+ #include "lwip/netif.h"
+ #include "lwip/err.h"
+=20
+@@ -39,9 +40,9 @@
+ extern "C" {
+ #endif
+=20
+-#if !LWIP_LOOPIF_MULTITHREADING
+-void loopif_poll(struct netif *netif);
+-#endif
++#if !LWIP_NETIF_LOOPBACK_MULTITHREADING
++#define loopif_poll netif_poll
++#endif /* !LWIP_NETIF_LOOPBACK_MULTITHREADING */
+=20
+ err_t loopif_init(struct netif *netif);
+=20
+Index: src/netif/etharp.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/src/netif/etharp.c,v
+retrieving revision 1.145
+retrieving revision 1.148
+diff -u -p -r1.145 -r1.148
+--- a/src/netif/etharp.c	4 Mar 2008 13:41:24 -0000	1.145
++++ b/src/netif/etharp.c	19 Jun 2008 16:40:59 -0000	1.148
+@@ -353,7 +353,7 @@ find_entry(struct ip_addr *ipaddr, u8_t=20
+    * 1) empty entry
+    * 2) oldest stable entry
+    * 3) oldest pending entry without queued packets
+-   * 4) oldest pending entry without queued packets
++   * 4) oldest pending entry with queued packets
+    *=20
+    * { ETHARP_TRY_HARD is set at this point }
+    */=20
+@@ -1130,7 +1130,14 @@ ethernet_input(struct pbuf *p, struct ne
+=20
+   /* points to packet payload, which starts with an Ethernet header */
+   ethhdr =3D p->payload;
+- =20
++  LWIP_DEBUGF(ETHARP_DEBUG | LWIP_DBG_TRACE,
++    ("ethernet_input: dest:%02x:%02x:%02x:%02x:%02x:%02x, src:%02x:%02x:%=
02x:%02x:%02x:%02x, type:%2hx\n",
++     (unsigned)ethhdr->dest.addr[0], (unsigned)ethhdr->dest.addr[1], (uns=
igned)ethhdr->dest.addr[2],
++     (unsigned)ethhdr->dest.addr[3], (unsigned)ethhdr->dest.addr[4], (uns=
igned)ethhdr->dest.addr[5],
++     (unsigned)ethhdr->src.addr[0], (unsigned)ethhdr->src.addr[1], (unsig=
ned)ethhdr->src.addr[2],
++     (unsigned)ethhdr->src.addr[3], (unsigned)ethhdr->src.addr[4], (unsig=
ned)ethhdr->src.addr[5],
++     (unsigned)htons(ethhdr->type)));
++
+   switch (htons(ethhdr->type)) {
+     /* IP packet? */
+     case ETHTYPE_IP:
+@@ -1165,6 +1172,8 @@ ethernet_input(struct pbuf *p, struct ne
+ #endif /* PPPOE_SUPPORT */
+=20
+     default:
++      ETHARP_STATS_INC(etharp.proterr);
++      ETHARP_STATS_INC(etharp.drop);
+       pbuf_free(p);
+       p =3D NULL;
+       break;
+Index: src/netif/loopif.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/src/netif/loopif.c,v
+retrieving revision 1.26
+retrieving revision 1.27
+diff -u -p -r1.26 -r1.27
+--- a/src/netif/loopif.c	31 Aug 2007 10:14:09 -0000	1.26
++++ b/src/netif/loopif.c	12 Jun 2008 20:10:10 -0000	1.27
+@@ -40,149 +40,8 @@
+ #if LWIP_HAVE_LOOPIF
+=20
+ #include "netif/loopif.h"
+-#include "lwip/pbuf.h"
+ #include "lwip/snmp.h"
+=20
+-#include <string.h>
+-
+-#if !LWIP_LOOPIF_MULTITHREADING
+-
+-#include "lwip/sys.h"
+-#include "lwip/mem.h"
+-
+-/* helper struct for the linked list of pbufs */
+-struct loopif_private {
+-  struct pbuf *first;
+-  struct pbuf *last;
+-};
+-
+-/**
+- * Call loopif_poll() in the main loop of your application. This is to pr=
event
+- * reentering non-reentrant functions like tcp_input(). Packets passed to
+- * loopif_output() are put on a list that is passed to netif->input() by
+- * loopif_poll().
+- *
+- * @param netif the lwip network interface structure for this loopif
+- */
+-void
+-loopif_poll(struct netif *netif)
+-{
+-  SYS_ARCH_DECL_PROTECT(lev);
+-  struct pbuf *in, *in_end;
+-  struct loopif_private *priv =3D (struct loopif_private*)netif->state;
+-
+-  LWIP_ERROR("priv !=3D NULL", (priv !=3D NULL), return;);
+-
+-  do {
+-    /* Get a packet from the list. With SYS_LIGHTWEIGHT_PROT=3D1, this is=
 protected */
+-    SYS_ARCH_PROTECT(lev);
+-    in =3D priv->first;
+-    if(in) {
+-      in_end =3D in;
+-      while(in_end->len !=3D in_end->tot_len) {
+-        LWIP_ASSERT("bogus pbuf: len !=3D tot_len but next =3D=3D NULL!",=
 in_end->next !=3D NULL);
+-        in_end =3D in_end->next;
+-      }
+-      /* 'in_end' now points to the last pbuf from 'in' */
+-      if(in_end =3D=3D priv->last) {
+-        /* this was the last pbuf in the list */
+-        priv->first =3D priv->last =3D NULL;
+-      } else {
+-        /* pop the pbuf off the list */
+-        priv->first =3D in_end->next;
+-        LWIP_ASSERT("should not be null since first !=3D last!", priv->fi=
rst !=3D NULL);
+-      }
+-    }
+-    SYS_ARCH_UNPROTECT(lev);
+- =20
+-    if(in !=3D NULL) {
+-      if(in_end->next !=3D NULL) {
+-        /* De-queue the pbuf from its successors on the 'priv' list. */
+-        in_end->next =3D NULL;
+-      }
+-      if(netif->input(in, netif) !=3D ERR_OK) {
+-        pbuf_free(in);
+-      }
+-      /* Don't reference the packet any more! */
+-      in =3D NULL;
+-      in_end =3D NULL;
+-    }
+-  /* go on while there is a packet on the list */
+-  } while(priv->first !=3D NULL);
+-}
+-#endif /* LWIP_LOOPIF_MULTITHREADING */
+-
+-/**
+- * Send an IP packet over the loopback interface.
+- * The pbuf is simply copied and handed back to netif->input.
+- * In multithreaded mode, this is done directly since netif->input must p=
ut
+- * the packet on a queue.
+- * In callback mode, the packet is put on an internal queue and is fed to
+- * netif->input by loopif_poll().
+- *
+- * @param netif the lwip network interface structure for this loopif
+- * @param p the (IP) packet to 'send'
+- * @param ipaddr the ip address to send the packet to (not used for loopi=
f)
+- * @return ERR_OK if the packet has been sent
+- *         ERR_MEM if the pbuf used to copy the packet couldn't be alloca=
ted
+- */
+-static err_t
+-loopif_output(struct netif *netif, struct pbuf *p,
+-       struct ip_addr *ipaddr)
+-{
+-#if !LWIP_LOOPIF_MULTITHREADING
+-  SYS_ARCH_DECL_PROTECT(lev);
+-  struct loopif_private *priv;
+-  struct pbuf *last;
+-#endif /* LWIP_LOOPIF_MULTITHREADING */
+-  struct pbuf *r;
+-  err_t err;
+-
+-  LWIP_UNUSED_ARG(ipaddr);
+-
+-  /* Allocate a new pbuf */
+-  r =3D pbuf_alloc(PBUF_RAW, p->tot_len, PBUF_RAM);
+-  if (r =3D=3D NULL) {
+-    return ERR_MEM;
+-  }
+-
+-  /* Copy the whole pbuf queue p into the single pbuf r */
+-  if ((err =3D pbuf_copy(r, p)) !=3D ERR_OK) {
+-    pbuf_free(r);
+-    r =3D NULL;
+-    return err;
+-  }
+-
+-#if LWIP_LOOPIF_MULTITHREADING
+-  /* Multithreading environment, netif->input() is supposed to put the pa=
cket
+-     into a mailbox, so we can safely call it here without risking to re-=
enter
+-     functions that are not reentrant (TCP!!!) */
+-  if(netif->input(r, netif) !=3D ERR_OK) {
+-    pbuf_free(r);
+-    r =3D NULL;
+-  }
+-#else /* LWIP_LOOPIF_MULTITHREADING */
+-  /* Raw API without threads: put the packet on a linked list which gets =
emptied
+-     through calling loopif_poll(). */
+-  priv =3D (struct loopif_private*)netif->state;
+-
+-  /* let last point to the last pbuf in chain r */
+-  for (last =3D r; last->next !=3D NULL; last =3D last->next);
+-  SYS_ARCH_PROTECT(lev);
+-  if(priv->first !=3D NULL) {
+-    LWIP_ASSERT("if first !=3D NULL, last must also be !=3D NULL", priv->=
last !=3D NULL);
+-    priv->last->next =3D r;
+-    priv->last =3D last;
+-  } else {
+-    priv->first =3D r;
+-    priv->last =3D last;
+-  }
+-  SYS_ARCH_UNPROTECT(lev);
+-#endif /* LWIP_LOOPIF_MULTITHREADING */
+-
+-  return ERR_OK;   =20
+-}
+-
+ /**
+  * Initialize a lwip network interface structure for a loopback interface
+  *
+@@ -193,16 +52,6 @@ loopif_output(struct netif *netif, struc
+ err_t
+ loopif_init(struct netif *netif)
+ {
+-#if !LWIP_LOOPIF_MULTITHREADING
+-  struct loopif_private *priv;
+-
+-  priv =3D (struct loopif_private*)mem_malloc(sizeof(struct loopif_privat=
e));
+-  if(priv =3D=3D NULL)=20
+-    return ERR_MEM;
+-  priv->first =3D priv->last =3D NULL;
+-  netif->state =3D priv;
+-#endif /* LWIP_LOOPIF_MULTITHREADING */
+-
+   /* initialize the snmp variables and counters inside the struct netif
+    * ifSpeed: no assumption can be made!
+    */
+@@ -210,7 +59,7 @@ loopif_init(struct netif *netif)
+=20
+   netif->name[0] =3D 'l';
+   netif->name[1] =3D 'o';
+-  netif->output =3D loopif_output;
++  netif->output =3D netif_loop_output;
+   return ERR_OK;
+ }
+=20
+Index: src/netif/slipif.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+RCS file: /sources/lwip/lwip/src/netif/slipif.c,v
+retrieving revision 1.29
+retrieving revision 1.30
+diff -u -p -r1.29 -r1.30
+--- a/src/netif/slipif.c	30 Nov 2007 17:22:21 -0000	1.29
++++ b/src/netif/slipif.c	17 Jun 2008 20:14:05 -0000	1.30
+@@ -44,6 +44,9 @@
+=20
+ #include "netif/slipif.h"
+ #include "lwip/opt.h"
++
++#if LWIP_HAVE_SLIPIF
++
+ #include "lwip/def.h"
+ #include "lwip/pbuf.h"
+ #include "lwip/sys.h"
+@@ -273,3 +276,4 @@ slipif_init(struct netif *netif)
+   sys_thread_new(SLIPIF_THREAD_NAME, slipif_loop, netif, SLIPIF_THREAD_ST=
ACKSIZE, SLIPIF_THREAD_PRIO);
+   return ERR_OK;
+ }
++#endif /* LWIP_HAVE_SLIPIF */
diff --git a/recipes-extended/xen/lwip.inc b/recipes-extended/xen/lwip.inc
new file mode 100644
index 0000000..e083633
--- /dev/null
+++ b/recipes-extended/xen/lwip.inc
@@ -0,0 +1,24 @@
+# Copyright (C) 2018 kebodiker <kurt.bodiker@braintrust-us.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+require stubdom.inc
+
+# clear this out to break dependency circle
+DEPENDS =3D ""
+
+# Nothing to configure or compile
+# For stubdoms, lwip is basically a source package with a couple of patche=
s applied.
+do_configure[noexec] =3D "1"
+do_compile[noexec] =3D "1"
+
+# needed because this directory isn't typically part of a sysroot
+SYSROOT_DIRS +=3D "${prefix}/lwip"
+
+FILES_${PN} =3D "\
+    ${prefix} \
+"
+
+do_install() {
+    install -d ${D}${prefix}/lwip
+    cp -r -t ${D}${prefix}/lwip ${S}/src/*
+}
diff --git a/recipes-extended/xen/lwip_1.3.0.bb b/recipes-extended/xen/lwip=
_1.3.0.bb
new file mode 100644
index 0000000..b7d8e95
--- /dev/null
+++ b/recipes-extended/xen/lwip_1.3.0.bb
@@ -0,0 +1,19 @@
+# Copyright (C) 2018 kebodiker <kurt.bodiker@braintrust-us.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION =3D "LWIP"
+HOMEPAGE =3D "https://savannah.nongnu.org/projects/lwip"
+LICENSE =3D "BSD"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59a383b05013356e0c9899b06dc5da3=
f"
+
+SRCREV_lwip =3D "bcb4afa886408bf0a1dde9c2a4a00323c8b07eb1"
+SRC_URI =3D "\
+    git://git.savannah.gnu.org/lwip.git;protocol=3Dgit;nobranch=3D1;destsu=
ffix=3Dlwip;name=3Dlwip \
+    file://lwip.patch-cvs \
+    file://lwip.dhcp_create_request-hwaddr_len.patch \
+"
+
+S=3D"${WORKDIR}/${PN}"
+B=3D"${S}"
+
+require lwip.inc
--=20
2.14.2


--=20

*This email and all attachments are considered confidential and the=20
proprietary information of BrainTrust Holdings.=C2=A0 Unauthorized disclosu=
re is=20
prohibited.=C2=A0 *

