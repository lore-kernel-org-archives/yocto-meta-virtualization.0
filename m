Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ED154E00D1C; Mon,  9 Sep 2019 10:28:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, FSL_HELO_FAKE,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000] *  1.7 FSL_HELO_FAKE FSL_HELO_FAKE
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.222.178 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
	[209.85.222.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1E0E9E008E3
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Sep 2019 10:28:07 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id q203so13884742qke.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 09 Sep 2019 10:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=WSc4L6UnfnPnWnLr/065aZazXvMXUzblAeWXpHMIKU4=;
	b=Agm/XdYvmP/halMOQZo4UA81ri/jVVihF2OVFuWPgvyIgOpC/AZXp8sw1SQle4vJlw
	rh6WzGCy5VWzIwDqFS9tYli6Nt5AnT5GBg+i7VDaxGk4LLWM0gucKk7igfIMOAPF3y3y
	UxsFNLgZ4IKpxeZIuFyiyWwbFRNpUaC7TlpmK0j6C9AViyUF3Ans9z7TqZxFa6IikcNr
	dXO3yJXbKCmesiMQiymETvaxSX1+HHuVs2VPgOy83Wyq+/+pMK9BF/NnEzkF06ki41eN
	bRu9U7t8YDZURavidCJzJ+JKZ62+lAGr95o7Nq0LmIRG4GJwYs7w1TM0BjQRBwVdXN03
	vHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=WSc4L6UnfnPnWnLr/065aZazXvMXUzblAeWXpHMIKU4=;
	b=n3o9iNU9MIuZlMWmqXAI7ZY2lEFm2BzijuzqCBrKdwGbalfTHhPi0DdRSqoySQBwgC
	P8Y/UBF6BWyMTB19jFff5W9Lk858JO30jEJjZOQGBBY2qxwYRxKEspR2WdY8HyUwpl49
	911hRRHMpbMno1OBZIRYG3BlCZbYK69gUx+5mVzv8OXsryrWcZgjWINDl9NmBFE3hFt7
	pQZYoq3IwAJ47hu1l+l6Y7sxa69aefs9zGvQR4/cCp98X/qZ7dVEVxsQ3sihW1DY7INf
	2THU3yAVqSyouO4VwUebMqi9JzkKNeisXk+4V0QcrR1zriftjlz6lXB1ucDrkJsc2r5A
	Kvvw==
X-Gm-Message-State: APjAAAWa9UwZ5RSt5Ux8ltOEtbXccf77V31VkBOfMZyjaOKIWQd8qMzk
	hi04VFyyF7EhpKMiw10JJCU=
X-Google-Smtp-Source: APXvYqzbNkqzAsjzuAOy/Sw+b5rJ0GOFhrETHJQYfR1aexv2DsQTVLKTLSwtzJlreEpTel/mv/d1CQ==
X-Received: by 2002:ae9:ef4c:: with SMTP id d73mr23723202qkg.57.1568050086999; 
	Mon, 09 Sep 2019 10:28:06 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id v12sm2766404qtb.5.2019.09.09.10.28.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Sep 2019 10:28:06 -0700 (PDT)
Date: Mon, 9 Sep 2019 13:28:04 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190909172801.GA26811@gmail.com>
References: <1567738340-20286-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1567738340-20286-1-git-send-email-akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [warrior][PATCH] libvirt: Five security fixes
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
X-List-Received-Date: Mon, 09 Sep 2019 17:28:12 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

In message: [meta-virtualization] [warrior][PATCH] libvirt: Five security fixes
on 05/09/2019 Armin Kuster wrote:

> From: Armin Kuster <akuster@mvista.com>
> 
> Affects <= 4.9.0
> 
> This affectively moves sources to tip
> Fixes the following cves.
> 
> CVE-2019-10132
> CVE-2019-10161
> CVE-2019-10166
> CVE-2019-10167
> CVE-2019-10168


Thanks armin. This is now merged to the warrior branch.

Bruce

> 
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  .../libvirt/libvirt/CVE-2019-10132_p1.patch        |  63 +++++++++++++
>  .../libvirt/libvirt/CVE-2019-10132_p2.patch        |  55 +++++++++++
>  .../libvirt/libvirt/CVE-2019-10132_p3.patch        |  55 +++++++++++
>  .../libvirt/libvirt/CVE-2019-10161.patch           | 101 +++++++++++++++++++++
>  .../libvirt/libvirt/CVE-2019-10166.patch           |  43 +++++++++
>  .../libvirt/libvirt/CVE-2019-10167.patch           |  41 +++++++++
>  .../libvirt/libvirt/CVE-2019-10168.patch           |  49 ++++++++++
>  recipes-extended/libvirt/libvirt_4.9.0.bb          |   7 ++
>  8 files changed, 414 insertions(+)
>  create mode 100644 recipes-extended/libvirt/libvirt/CVE-2019-10132_p1.patch
>  create mode 100644 recipes-extended/libvirt/libvirt/CVE-2019-10132_p2.patch
>  create mode 100644 recipes-extended/libvirt/libvirt/CVE-2019-10132_p3.patch
>  create mode 100644 recipes-extended/libvirt/libvirt/CVE-2019-10161.patch
>  create mode 100644 recipes-extended/libvirt/libvirt/CVE-2019-10166.patch
>  create mode 100644 recipes-extended/libvirt/libvirt/CVE-2019-10167.patch
>  create mode 100644 recipes-extended/libvirt/libvirt/CVE-2019-10168.patch
> 
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2019-10132_p1.patch b/recipes-extended/libvirt/libvirt/CVE-2019-10132_p1.patch
> new file mode 100644
> index 0000000..1f958fa
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2019-10132_p1.patch
> @@ -0,0 +1,63 @@
> +From b0f788c2d3d9930015258a7df95dde80a498e657 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
> +Date: Tue, 30 Apr 2019 17:26:13 +0100
> +Subject: [PATCH 1/7] admin: reject clients unless their UID matches the
> + current UID
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The admin protocol RPC messages are only intended for use by the user
> +running the daemon. As such they should not be allowed for any client
> +UID that does not match the server UID.
> +
> +Fixes CVE-2019-10132
> +
> +Reviewed-by: Ján Tomko <jtomko@redhat.com>
> +Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> +(cherry picked from commit 96f41cd765c9e525fe28ee5abbfbf4a79b3720c7)
> +
> +Upstream-Status: Backport
> +CVE: CVE-2019-10132 patch #1
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + src/admin/admin_server_dispatch.c | 22 ++++++++++++++++++++++
> + 1 file changed, 22 insertions(+)
> +
> +diff --git a/src/admin/admin_server_dispatch.c b/src/admin/admin_server_dispatch.c
> +index b78ff90..9f25813 100644
> +--- a/src/admin/admin_server_dispatch.c
> ++++ b/src/admin/admin_server_dispatch.c
> +@@ -66,6 +66,28 @@ remoteAdmClientNew(virNetServerClientPtr client ATTRIBUTE_UNUSED,
> +                    void *opaque)
> + {
> +     struct daemonAdmClientPrivate *priv;
> ++    uid_t clientuid;
> ++    gid_t clientgid;
> ++    pid_t clientpid;
> ++    unsigned long long timestamp;
> ++
> ++    if (virNetServerClientGetUNIXIdentity(client,
> ++                                          &clientuid,
> ++                                          &clientgid,
> ++                                          &clientpid,
> ++                                          &timestamp) < 0)
> ++        return NULL;
> ++
> ++    VIR_DEBUG("New client pid %lld uid %lld",
> ++              (long long)clientpid,
> ++              (long long)clientuid);
> ++
> ++    if (geteuid() != clientuid) {
> ++        virReportRestrictedError(_("Disallowing client %lld with uid %lld"),
> ++                                 (long long)clientpid,
> ++                                 (long long)clientuid);
> ++        return NULL;
> ++    }
> + 
> +     if (VIR_ALLOC(priv) < 0)
> +         return NULL;
> +-- 
> +2.7.4
> +
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2019-10132_p2.patch b/recipes-extended/libvirt/libvirt/CVE-2019-10132_p2.patch
> new file mode 100644
> index 0000000..2fffe14
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2019-10132_p2.patch
> @@ -0,0 +1,55 @@
> +From ea014c9fcf19539c75a7cb6926b14858426746a7 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
> +Date: Tue, 30 Apr 2019 16:51:37 +0100
> +Subject: [PATCH 2/7] locking: restrict sockets to mode 0600
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The virtlockd daemon's only intended client is the libvirtd daemon. As
> +such it should never allow clients from other user accounts to connect.
> +The code already enforces this and drops clients from other UIDs, but
> +we can get earlier (and thus stronger) protection against DoS by setting
> +the socket permissions to 0600
> +
> +Fixes CVE-2019-10132
> +
> +Reviewed-by: Ján Tomko <jtomko@redhat.com>
> +Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> +(cherry picked from commit f111e09468693909b1f067aa575efdafd9a262a1)
> +
> +Upstream-Status: Backport
> +CVE: CVE-2019-10132 patch #2
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +---
> + src/locking/virtlockd-admin.socket.in | 1 +
> + src/locking/virtlockd.socket.in       | 1 +
> + 2 files changed, 2 insertions(+)
> +
> +diff --git a/src/locking/virtlockd-admin.socket.in b/src/locking/virtlockd-admin.socket.in
> +index 2a7500f..f674c49 100644
> +--- a/src/locking/virtlockd-admin.socket.in
> ++++ b/src/locking/virtlockd-admin.socket.in
> +@@ -5,6 +5,7 @@ Before=libvirtd.service
> + [Socket]
> + ListenStream=@localstatedir@/run/libvirt/virtlockd-admin-sock
> + Service=virtlockd.service
> ++SocketMode=0600
> + 
> + [Install]
> + WantedBy=sockets.target
> +diff --git a/src/locking/virtlockd.socket.in b/src/locking/virtlockd.socket.in
> +index 45e0f20..d701b27 100644
> +--- a/src/locking/virtlockd.socket.in
> ++++ b/src/locking/virtlockd.socket.in
> +@@ -4,6 +4,7 @@ Before=libvirtd.service
> + 
> + [Socket]
> + ListenStream=@localstatedir@/run/libvirt/virtlockd-sock
> ++SocketMode=0600
> + 
> + [Install]
> + WantedBy=sockets.target
> +-- 
> +2.7.4
> +
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2019-10132_p3.patch b/recipes-extended/libvirt/libvirt/CVE-2019-10132_p3.patch
> new file mode 100644
> index 0000000..0cb0005
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2019-10132_p3.patch
> @@ -0,0 +1,55 @@
> +From a474f18dceed61d562508980999e5f2d7445d683 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
> +Date: Tue, 30 Apr 2019 17:27:41 +0100
> +Subject: [PATCH 3/7] logging: restrict sockets to mode 0600
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The virtlogd daemon's only intended client is the libvirtd daemon. As
> +such it should never allow clients from other user accounts to connect.
> +The code already enforces this and drops clients from other UIDs, but
> +we can get earlier (and thus stronger) protection against DoS by setting
> +the socket permissions to 0600
> +
> +Fixes CVE-2019-10132
> +
> +Reviewed-by: Ján Tomko <jtomko@redhat.com>
> +Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> +(cherry picked from commit e37bd65f9948c1185456b2cdaa3bd6e875af680f)
> +
> +Upstream-Status: Backport
> +CVE: CVE-2019-10132 patch #3
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +---
> + src/logging/virtlogd-admin.socket.in | 1 +
> + src/logging/virtlogd.socket.in       | 1 +
> + 2 files changed, 2 insertions(+)
> +
> +diff --git a/src/logging/virtlogd-admin.socket.in b/src/logging/virtlogd-admin.socket.in
> +index 595e6c4..5c41dfe 100644
> +--- a/src/logging/virtlogd-admin.socket.in
> ++++ b/src/logging/virtlogd-admin.socket.in
> +@@ -5,6 +5,7 @@ Before=libvirtd.service
> + [Socket]
> + ListenStream=@localstatedir@/run/libvirt/virtlogd-admin-sock
> + Service=virtlogd.service
> ++SocketMode=0600
> + 
> + [Install]
> + WantedBy=sockets.target
> +diff --git a/src/logging/virtlogd.socket.in b/src/logging/virtlogd.socket.in
> +index 22b9360..ae48cda 100644
> +--- a/src/logging/virtlogd.socket.in
> ++++ b/src/logging/virtlogd.socket.in
> +@@ -4,6 +4,7 @@ Before=libvirtd.service
> + 
> + [Socket]
> + ListenStream=@localstatedir@/run/libvirt/virtlogd-sock
> ++SocketMode=0600
> + 
> + [Install]
> + WantedBy=sockets.target
> +-- 
> +2.7.4
> +
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2019-10161.patch b/recipes-extended/libvirt/libvirt/CVE-2019-10161.patch
> new file mode 100644
> index 0000000..72e69a8
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2019-10161.patch
> @@ -0,0 +1,101 @@
> +From 568c735d7b0ccb55f9476c86f8603eb3a5c9fc5c Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?J=C3=A1n=20Tomko?= <jtomko@redhat.com>
> +Date: Fri, 14 Jun 2019 08:47:42 +0200
> +Subject: [PATCH 4/7] api: disallow virDomainSaveImageGetXMLDesc on read-only
> + connections
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The virDomainSaveImageGetXMLDesc API is taking a path parameter,
> +which can point to any path on the system. This file will then be
> +read and parsed by libvirtd running with root privileges.
> +
> +Forbid it on read-only connections.
> +
> +Fixes: CVE-2019-10161
> +Reported-by: Matthias Gerstner <mgerstner@suse.de>
> +Signed-off-by: Ján Tomko <jtomko@redhat.com>
> +Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> +(cherry picked from commit aed6a032cead4386472afb24b16196579e239580)
> +Signed-off-by: Ján Tomko <jtomko@redhat.com>
> +
> +Conflicts:
> +  src/libvirt-domain.c
> +  src/remote/remote_protocol.x
> +
> +Upstream commit 12a51f372 which introduced the VIR_DOMAIN_SAVE_IMAGE_XML_SECURE
> +alias for VIR_DOMAIN_XML_SECURE is not backported.
> +Just skip the commit since we now disallow the whole API on read-only
> +connections, regardless of the flag.
> +
> +Signed-off-by: Ján Tomko <jtomko@redhat.com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2019-19161
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +---
> + src/libvirt-domain.c         | 11 ++---------
> + src/qemu/qemu_driver.c       |  2 +-
> + src/remote/remote_protocol.x |  3 +--
> + 3 files changed, 4 insertions(+), 12 deletions(-)
> +
> +diff --git a/src/libvirt-domain.c b/src/libvirt-domain.c
> +index 7690339..c188239 100644
> +--- a/src/libvirt-domain.c
> ++++ b/src/libvirt-domain.c
> +@@ -1073,9 +1073,7 @@ virDomainRestoreFlags(virConnectPtr conn, const char *from, const char *dxml,
> +  * previously by virDomainSave() or virDomainSaveFlags().
> +  *
> +  * No security-sensitive data will be included unless @flags contains
> +- * VIR_DOMAIN_XML_SECURE; this flag is rejected on read-only
> +- * connections.  For this API, @flags should not contain either
> +- * VIR_DOMAIN_XML_INACTIVE or VIR_DOMAIN_XML_UPDATE_CPU.
> ++ * VIR_DOMAIN_XML_SECURE.
> +  *
> +  * Returns a 0 terminated UTF-8 encoded XML instance, or NULL in case of
> +  * error.  The caller must free() the returned value.
> +@@ -1091,12 +1089,7 @@ virDomainSaveImageGetXMLDesc(virConnectPtr conn, const char *file,
> + 
> +     virCheckConnectReturn(conn, NULL);
> +     virCheckNonNullArgGoto(file, error);
> +-
> +-    if ((conn->flags & VIR_CONNECT_RO) && (flags & VIR_DOMAIN_XML_SECURE)) {
> +-        virReportError(VIR_ERR_OPERATION_DENIED, "%s",
> +-                       _("virDomainSaveImageGetXMLDesc with secure flag"));
> +-        goto error;
> +-    }
> ++    virCheckReadOnlyGoto(conn->flags, error);
> + 
> +     if (conn->driver->domainSaveImageGetXMLDesc) {
> +         char *ret;
> +diff --git a/src/qemu/qemu_driver.c b/src/qemu/qemu_driver.c
> +index a52e249..f7656e5 100644
> +--- a/src/qemu/qemu_driver.c
> ++++ b/src/qemu/qemu_driver.c
> +@@ -6798,7 +6798,7 @@ qemuDomainSaveImageGetXMLDesc(virConnectPtr conn, const char *path,
> +     if (fd < 0)
> +         goto cleanup;
> + 
> +-    if (virDomainSaveImageGetXMLDescEnsureACL(conn, def, flags) < 0)
> ++    if (virDomainSaveImageGetXMLDescEnsureACL(conn, def) < 0)
> +         goto cleanup;
> + 
> +     ret = qemuDomainDefFormatXML(driver, def, flags);
> +diff --git a/src/remote/remote_protocol.x b/src/remote/remote_protocol.x
> +index 28c8feb..52b9233 100644
> +--- a/src/remote/remote_protocol.x
> ++++ b/src/remote/remote_protocol.x
> +@@ -5226,8 +5226,7 @@ enum remote_procedure {
> +     /**
> +      * @generate: both
> +      * @priority: high
> +-     * @acl: domain:read
> +-     * @acl: domain:read_secure:VIR_DOMAIN_XML_SECURE
> ++     * @acl: domain:write
> +      */
> +     REMOTE_PROC_DOMAIN_SAVE_IMAGE_GET_XML_DESC = 235,
> + 
> +-- 
> +2.7.4
> +
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2019-10166.patch b/recipes-extended/libvirt/libvirt/CVE-2019-10166.patch
> new file mode 100644
> index 0000000..6305ffd
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2019-10166.patch
> @@ -0,0 +1,43 @@
> +From 0a744e15517d727c7f473fabe32ca6b0dbb7b7d1 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?J=C3=A1n=20Tomko?= <jtomko@redhat.com>
> +Date: Fri, 14 Jun 2019 09:14:53 +0200
> +Subject: [PATCH 5/7] api: disallow virDomainManagedSaveDefineXML on read-only
> + connections
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The virDomainManagedSaveDefineXML can be used to alter the domain's
> +config used for managedsave or even execute arbitrary emulator binaries.
> +Forbid it on read-only connections.
> +
> +Fixes: CVE-2019-10166
> +Reported-by: Matthias Gerstner <mgerstner@suse.de>
> +Signed-off-by: Ján Tomko <jtomko@redhat.com>
> +Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> +(cherry picked from commit db0b78457f183e4c7ac45bc94de86044a1e2056a)
> +Signed-off-by: Ján Tomko <jtomko@redhat.com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2019-19166
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + src/libvirt-domain.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/libvirt-domain.c b/src/libvirt-domain.c
> +index c188239..d8b64c0 100644
> +--- a/src/libvirt-domain.c
> ++++ b/src/libvirt-domain.c
> +@@ -9490,6 +9490,7 @@ virDomainManagedSaveDefineXML(virDomainPtr domain, const char *dxml,
> + 
> +     virCheckDomainReturn(domain, -1);
> +     conn = domain->conn;
> ++    virCheckReadOnlyGoto(conn->flags, error);
> + 
> +     if (conn->driver->domainManagedSaveDefineXML) {
> +         int ret;
> +-- 
> +2.7.4
> +
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2019-10167.patch b/recipes-extended/libvirt/libvirt/CVE-2019-10167.patch
> new file mode 100644
> index 0000000..abca309
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2019-10167.patch
> @@ -0,0 +1,41 @@
> +From 6452b9fdff7988024a6157ca0a973ac3abf54468 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?J=C3=A1n=20Tomko?= <jtomko@redhat.com>
> +Date: Fri, 14 Jun 2019 09:16:14 +0200
> +Subject: [PATCH 6/7] api: disallow virConnectGetDomainCapabilities on
> + read-only connections
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +This API can be used to execute arbitrary emulators.
> +Forbid it on read-only connections.
> +
> +Fixes: CVE-2019-10167
> +Signed-off-by: Ján Tomko <jtomko@redhat.com>
> +Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> +(cherry picked from commit 8afa68bac0cf99d1f8aaa6566685c43c22622f26)
> +Signed-off-by: Ján Tomko <jtomko@redhat.com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2019-19167
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + src/libvirt-domain.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/libvirt-domain.c b/src/libvirt-domain.c
> +index d8b64c0..1e1c4e3 100644
> +--- a/src/libvirt-domain.c
> ++++ b/src/libvirt-domain.c
> +@@ -11282,6 +11282,7 @@ virConnectGetDomainCapabilities(virConnectPtr conn,
> +     virResetLastError();
> + 
> +     virCheckConnectReturn(conn, NULL);
> ++    virCheckReadOnlyGoto(conn->flags, error);
> + 
> +     if (conn->driver->connectGetDomainCapabilities) {
> +         char *ret;
> +-- 
> +2.7.4
> +
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2019-10168.patch b/recipes-extended/libvirt/libvirt/CVE-2019-10168.patch
> new file mode 100644
> index 0000000..2211238
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2019-10168.patch
> @@ -0,0 +1,49 @@
> +From dd88b69a207c1ed6e89d7e9fa6b5f4a9ec4db97c Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?J=C3=A1n=20Tomko?= <jtomko@redhat.com>
> +Date: Fri, 14 Jun 2019 09:17:39 +0200
> +Subject: [PATCH 7/7] api: disallow virConnect*HypervisorCPU on read-only
> + connections
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +These APIs can be used to execute arbitrary emulators.
> +Forbid them on read-only connections.
> +
> +Fixes: CVE-2019-10168
> +Signed-off-by: Ján Tomko <jtomko@redhat.com>
> +Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> +(cherry picked from commit bf6c2830b6c338b1f5699b095df36f374777b291)
> +Signed-off-by: Ján Tomko <jtomko@redhat.com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2019-19168
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + src/libvirt-host.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/libvirt-host.c b/src/libvirt-host.c
> +index e20d6ee..2978825 100644
> +--- a/src/libvirt-host.c
> ++++ b/src/libvirt-host.c
> +@@ -1041,6 +1041,7 @@ virConnectCompareHypervisorCPU(virConnectPtr conn,
> + 
> +     virCheckConnectReturn(conn, VIR_CPU_COMPARE_ERROR);
> +     virCheckNonNullArgGoto(xmlCPU, error);
> ++    virCheckReadOnlyGoto(conn->flags, error);
> + 
> +     if (conn->driver->connectCompareHypervisorCPU) {
> +         int ret;
> +@@ -1234,6 +1235,7 @@ virConnectBaselineHypervisorCPU(virConnectPtr conn,
> + 
> +     virCheckConnectReturn(conn, NULL);
> +     virCheckNonNullArgGoto(xmlCPUs, error);
> ++    virCheckReadOnlyGoto(conn->flags, error);
> + 
> +     if (conn->driver->connectBaselineHypervisorCPU) {
> +         char *cpu;
> +-- 
> +2.7.4
> +
> diff --git a/recipes-extended/libvirt/libvirt_4.9.0.bb b/recipes-extended/libvirt/libvirt_4.9.0.bb
> index 813d95e..db5a4f9 100644
> --- a/recipes-extended/libvirt/libvirt_4.9.0.bb
> +++ b/recipes-extended/libvirt/libvirt_4.9.0.bb
> @@ -36,6 +36,13 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
>             file://0001-ptest-Remove-Windows-1252-check-from-esxutilstest.patch \
>             file://configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch \
>             file://hook_support.py \
> +           file://CVE-2019-10132_p1.patch \
> +           file://CVE-2019-10132_p2.patch \
> +           file://CVE-2019-10132_p3.patch \
> +           file://CVE-2019-10161.patch \
> +           file://CVE-2019-10166.patch \
> +           file://CVE-2019-10167.patch \ 
> +           file://CVE-2019-10168.patch \
>            "
>  
>  SRC_URI[libvirt.md5sum] = "aaf7b265ac2013d6eb184a86b5f7eeb9"
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

