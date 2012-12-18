Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-bk0-f41.google.com (mail-bk0-f41.google.com
	[209.85.214.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C56BBE011AF
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:14 -0800 (PST)
Received: by mail-bk0-f41.google.com with SMTP id jg9so365776bkc.14
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Dec 2012 06:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=LnqFHhK48k47cOAPZDir4V1+htCLjqWG3ZxesE06k2Q=;
	b=AalwPxtx95fRVg0EBogvq0DsJR+uIa9n9DfhfFBvjUD4+1MuttvrmvgOe0fErF0p10
	9QGUtQmgD+VYc2+CDDcWGmaatKk5z5SpVAPxrWebx8EuOHzAV+A9Iln3QepMGVaeauB4
	3sAfhnm+kyYKK+5Bj8/BnEA3c3GFaxA7GYaNCZ4jU8ARc5keoRpsqCroHMZ6lgyMYB75
	6j67KaWnUxUppwACWz2VPRScsoZjudD3Re63AYY545PXRHpa+cC78kocKV014tpitj/j
	za0zAGLJjfKuzUADxFnw9m24oFbKCK7HrytwoxymWUcakfnfjVRFIJTZgdssnKBJWGkb
	3qGQ==
X-Received: by 10.204.6.87 with SMTP id 23mr819474bky.78.1355841133850;
	Tue, 18 Dec 2012 06:32:13 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id d16sm1504831bkw.2.2012.12.18.06.32.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 06:32:12 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 1D0D34009A5; Tue, 18 Dec 2012 15:32:01 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 18 Dec 2012 15:31:42 +0100
Message-Id: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: raymond.danks@se-eng.com
Subject: [RFC][PATCH 00/16] Adding python client APIs for glance, quantum and keystone
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
X-List-Received-Date: Tue, 18 Dec 2012 14:32:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sending these patches as an RFC since it includes a removal of a meta-virt patch on 
python-2.7.3. Also, some of the common python packages might not be optimal to keep in the 
meta-virtualization layer, some should perhaps be sent as package updates to oe-core.

David Nyström (16):
  Removed meta-virtualization private patch, and using upstream instead
  Added python-cliff recipe
  Added python-cmd2 recipe
  Added python-httplib2 recipe
  Added python-jsonpatch recipe
  Added python-jsonpointer recipe
  Added python-jsonschema recipe
  Added python-prettytable recipe
  Added python-pycrypto recipe
  Added python-pyopenssl recipe
  Added python-pyparsing recipe
  Added python-simplejson recipe
  Added python-warlock recipe
  Added python-glanceclient recipe
  Added python-quantumclient recipe
  Added python-keystoneclient recipe

 .../glanceclient/python-glanceclient_git.bb        |   26 ++++
 .../keystoneclient/python-keystoneclient_git.bb    |   24 ++++
 .../quantumclient/python-quantumclient_git.bb      |   23 ++++
 .../01-use-proper-tools-for-cross-build.patch      |  138 --------------------
 recipes-devtools/python/python_2.7.3.bbappend      |    9 --
 .../files/001-remove-distribute-dependency.patch   |   24 ++++
 recipes-python/cliff/python-cliff_1.3.bb           |   29 ++++
 recipes-python/cmd2/python-cmd2_0.6.4.bb           |   20 +++
 recipes-python/httplib2/python-httplib2_0.7.7.bb   |   19 +++
 recipes-python/jsonpatch/python-jsonpatch_0.10.bb  |   20 +++
 .../jsonpointer/python-jsonpointer_0.5.bb          |   16 +++
 recipes-python/jsonschema/python-jsonschema_0.7.bb |   22 ++++
 .../prettytable/python-prettytable_0.6.1.bb        |   18 +++
 recipes-python/pyOpenSSL/python-pyopenssl_0.13.bb  |   20 +++
 .../pycrypto/files/001-remove-includes.patch       |   11 ++
 recipes-python/pycrypto/python-pycrypto_2.6.bb     |   46 +++++++
 recipes-python/pyparsing/python-pyparsing_1.5.6.bb |   22 ++++
 .../simplejson/python-simplejson_2.6.2.bb          |   21 +++
 recipes-python/warlock/python-warlock_0.7.0.bb     |   26 ++++
 19 files changed, 387 insertions(+), 147 deletions(-)
 create mode 100644 recipes-cloud/glanceclient/python-glanceclient_git.bb
 create mode 100644 recipes-cloud/keystoneclient/python-keystoneclient_git.bb
 create mode 100644 recipes-cloud/quantumclient/python-quantumclient_git.bb
 delete mode 100644 recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
 delete mode 100644 recipes-devtools/python/python_2.7.3.bbappend
 create mode 100644 recipes-python/cliff/files/001-remove-distribute-dependency.patch
 create mode 100644 recipes-python/cliff/python-cliff_1.3.bb
 create mode 100644 recipes-python/cmd2/python-cmd2_0.6.4.bb
 create mode 100644 recipes-python/httplib2/python-httplib2_0.7.7.bb
 create mode 100644 recipes-python/jsonpatch/python-jsonpatch_0.10.bb
 create mode 100644 recipes-python/jsonpointer/python-jsonpointer_0.5.bb
 create mode 100644 recipes-python/jsonschema/python-jsonschema_0.7.bb
 create mode 100644 recipes-python/prettytable/python-prettytable_0.6.1.bb
 create mode 100644 recipes-python/pyOpenSSL/python-pyopenssl_0.13.bb
 create mode 100644 recipes-python/pycrypto/files/001-remove-includes.patch
 create mode 100644 recipes-python/pycrypto/python-pycrypto_2.6.bb
 create mode 100644 recipes-python/pyparsing/python-pyparsing_1.5.6.bb
 create mode 100644 recipes-python/simplejson/python-simplejson_2.6.2.bb
 create mode 100644 recipes-python/warlock/python-warlock_0.7.0.bb

-- 
1.7.9.5


