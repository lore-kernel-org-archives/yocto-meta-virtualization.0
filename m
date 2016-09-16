Return-Path: <Adrian.Dudau@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 02392E00C7A; Fri, 16 Sep 2016 06:55:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [185.38.180.38 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 310 seconds by postgrey-1.32 at yocto-www;
	Fri, 16 Sep 2016 06:55:03 PDT
Received: from smtp-out10.electric.net (smtp-out10.electric.net
	[185.38.180.38])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CDC18E009A0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 16 Sep 2016 06:55:03 -0700 (PDT)
Received: from 1bktWZ-0002Eh-VQ by out10a.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <Adrian.Dudau@enea.com>) id 1bktWa-0002F4-Tf
	for meta-virtualization@yoctoproject.org;
	Fri, 16 Sep 2016 06:49:52 -0700
Received: by emcmailer; Fri, 16 Sep 2016 06:49:52 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out10a.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <Adrian.Dudau@enea.com>) id 1bktWZ-0002Eh-VQ
	for meta-virtualization@yoctoproject.org;
	Fri, 16 Sep 2016 06:49:51 -0700
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 16 Sep 2016 15:49:51 +0200
Received: by sestofb11.enea.se (Postfix, from userid 4451)	id 74505441B91;
	Fri, 16 Sep 2016 15:49:51 +0200 (CEST)
From: Adrian Dudau <adrian.dudau@enea.com>
To: <meta-virtualization@yoctoproject.org>
Message-ID: <1474033791-18199-1-git-send-email-adrian.dudau@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: adrian.dudau@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: Adrian.Dudau@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:AES128-SHA:128
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
X-Mailman-Approved-At: Fri, 23 Dec 2016 16:01:39 -0800
Subject: [meta-cloud-services][PATCH] openstackchef_inc.bbclass: Update python synthax for except
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
Date: Fri, 16 Sep 2016 13:55:07 -0000
X-Original-Date: Fri, 16 Sep 2016 15:49:51 +0200
X-List-Received-Date: Fri, 16 Sep 2016 13:55:07 -0000
Content-Type: text/plain

The synthax used is deprecated and causes errors.

Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
---
 meta-openstack/classes/openstackchef_inc.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/classes/openstackchef_inc.bbclass b/meta-openstack/classes/openstackchef_inc.bbclass
index b8757be..048fce6 100644
--- a/meta-openstack/classes/openstackchef_inc.bbclass
+++ b/meta-openstack/classes/openstackchef_inc.bbclass
@@ -248,7 +248,7 @@ def deploychef_make_startup_shutdown_list(d):
                     raise bb.build.FuncFailed(msg)
             hStartup.close()
             hShutdown.close()
-        except IOError, e:
+        except IOError as e:
             bb.error("Error opening startup/shutdown files %s %s,  %s %s" % \
             (startup_file, shutdown_file, d.getVar('FILE'), e))
     else:
@@ -381,7 +381,7 @@ def deploychef_make_templates( d, conf_tuple=tuple()):
                         deploychef_make_substitutions(d, sub_dict, attr_file, file_name)
                     else:
                         bb.build.FuncFailed(msg)
-        except IOError, e:
+        except IOError as e:
             bb.error("Could not write to attribute file %s: in %s,  %s" % \
             (attr_file, d.getVar('FILE'), e))
 
-- 
1.9.1


