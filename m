Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A48FD12694
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 08:24:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10185.1764750267123505961
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 Dec 2025 00:24:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ozA6voJa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=443253538a=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B34tl4S2510471
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 3 Dec 2025 08:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=MAQ0FoNe/2r/58BEwVaG
	EtwNJPkG8tLFmW+GigVLjpM=; b=ozA6voJaEgAs26k1dhzAJ156H/XKuI/jPCS4
	MeFhW9ya242l3lfMjkJgfaMJDE5sYnf0udbr11iD1HWvc5yBnQ60JBLBrI6jtBuh
	KCi5N/qpO3sG5p93lskCAqccJX4YijJKvFhpaGCI6F6khaoZrbS2ODf4c5CTMKrm
	E720vCUC5cTI1zAvW/PfWvLKLBO0y0jGEf3P6oGRViPVBCMffNDffBTwriLYapdb
	zg2RyEtguofRBGQXfOaD2MLFsGQmpjf9gLa4/P7n4VrcOXtJTvdbdRK0o9Uu7ER+
	+RHpu2XmIsqWUIHoY9BIdUXjQFI9q9jmgWOFU9gQ7/pJWeR0Qg==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt6ckf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 03 Dec 2025 08:24:25 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 3 Dec 2025 00:24:24 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 3 Dec 2025 00:24:24 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH 1/2] virt-manager: switch from libxml2 to python3-lxml
Date: Wed, 3 Dec 2025 16:24:22 +0800
Message-ID: <20251203082423.2747388-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA2NSBTYWx0ZWRfX3/dwf2xB9HX+
 /ncjnm8Cx8+YAnTH4Pe0QAormAhCUX9Pxbgt4VsoOz2wWM/CdNnzIHp2IWg+nEc9otDV7IsUtkC
 nn56WXoQZFrnQlXWusTpqJzjzw7WGROarz04KILRdLXv5DvlPXY9ML69h8UMB9DGkPI5xJdw7ry
 tri9mLQAuYAcIHpo1qXfLdi6k6xs6EDLeO0j3jpVAMvjCHix3lHSziqI4K2QjRZ6ZinKFYk1mFt
 EMV3b0VBEKbijoYGXG+REEz+9LKuV/fpPsU2GNkhyXZaIdl3hEmPETQT6m53KF83vLIRQOW51fz
 wgm+WCEHCdD3pDnrrufpac+b1BNTlA9oj1RuvoJk8Y3anUO370Nas6RABh+AY93SQpGzCpI3eqE
 VlCtd8zJspQggUTsE7gBfSlSZxFkSA==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=692ff3b9 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=GHR8O2WEAAAA:20
 a=NEAV23lmAAAA:8 a=FG0Cc2vJAAAA:8 a=mNYpJT6RAAAA:8 a=qjkT5h8hAAAA:8
 a=JjJLzm1KAAAA:20 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=ijl67acwOEinUyF5kr4A:9
 a=m9p5bXcFLgAA:10 a=3ZOxICGb0QBxI-nHBaED:22 a=eybOJ6GWDyyBfQoUqdmp:22
 a=bKotK0tb0Zdhfv-iQwbr:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: qIX8YE3bO5V48_G_ZVJPWWwIHcXUkRYQ
X-Proofpoint-GUID: qIX8YE3bO5V48_G_ZVJPWWwIHcXUkRYQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1011
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030065
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 03 Dec 2025 08:24:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9475

Due to libxml2 deprecate python bindings[1], virt-manager is trying to switch
from libxml2 to lxml[2], port them to Yocto

[1] https://gitlab.gnome.org/GNOME/libxml2/-/issues/891
[2] https://github.com/virt-manager/virt-manager/pull/927

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...he-code-to-use-lxml-instead-of-libxm.patch | 493 ++++++++++++++++++
 .../virt-manager/virt-manager_git.bb          |   5 +-
 2 files changed, 496 insertions(+), 2 deletions(-)
 create mode 100644 recipes-extended/virt-manager/virt-manager/0001-xmlapi-rewrite-the-code-to-use-lxml-instead-of-libxm.patch

diff --git a/recipes-extended/virt-manager/virt-manager/0001-xmlapi-rewrite-the-code-to-use-lxml-instead-of-libxm.patch b/recipes-extended/virt-manager/virt-manager/0001-xmlapi-rewrite-the-code-to-use-lxml-instead-of-libxm.patch
new file mode 100644
index 00000000..eef41a28
--- /dev/null
+++ b/recipes-extended/virt-manager/virt-manager/0001-xmlapi-rewrite-the-code-to-use-lxml-instead-of-libxm.patch
@@ -0,0 +1,493 @@
+From 3e82a4cf696aad33c3cf14da92f4223eb14cfaa5 Mon Sep 17 00:00:00 2001
+From: Pavel Hrdina <phrdina@redhat.com>
+Date: Thu, 17 Apr 2025 14:46:58 +0200
+Subject: [PATCH] xmlapi: rewrite the code to use lxml instead of libxml2
+
+The python module libxml2 is part of the libxml2 library and they are
+planning to deprecate and remove this binding in favor of lxml that also
+uses libxml2 but the binding is done in more pythonic way.
+
+The change to use lxml uncovered some incorrectly formatted bits in our
+test XMLs that are now fixed.
+
+Disable new pylint category c-extension-no-member as lxml is not
+introspected by default and pylint complains about it.
+
+Resolves: https://github.com/virt-manager/virt-manager/issues/897
+Signed-off-by: Pavel Hrdina <phrdina@redhat.com>
+
+Upstream-Status: Submitted [https://github.com/virt-manager/virt-manager/pull/927]
+Signed-off-by: Hongxu Jia <hongxu.jia@eng.windriver.com>
+---
+ .pylintrc                                     |   2 +-
+ .../virt-xml-update-nodefine-succeed.xml      |   8 +-
+ .../cli/compare/virt-xml-update-succeed.xml   |   8 +-
+ tests/data/xmlparse/add-devices-out.xml       |   3 +-
+ tests/data/xmlparse/change-chars-out.xml      |   3 +-
+ tests/data/xmlparse/change-disk-out.xml       |   3 +-
+ tests/data/xmlparse/change-nics-out.xml       |   3 +-
+ tests/data/xmlparse/domain-roundtrip.xml      |  52 ++++----
+ tests/data/xmlparse/network-vf-pool-out.xml   |   6 +-
+ tests/test_cli.py                             |   2 +-
+ tests/test_xmlparse.py                        |  19 +--
+ virt-manager.spec.in                          |   2 +-
+ virtinst/xmlapi.py                            | 126 +++++-------------
+ 13 files changed, 92 insertions(+), 145 deletions(-)
+
+diff --git a/.pylintrc b/.pylintrc
+index a9a7b7733..c54abd812 100644
+--- a/.pylintrc
++++ b/.pylintrc
+@@ -3,7 +3,7 @@
+ # can either give multiple identifier separated by comma (,) or put this option
+ # multiple time (only on the command line, not in the configuration file where
+ # it should appear only once).
+-disable=Design,Similarities,invalid-name,missing-docstring,line-too-long,too-many-lines,superfluous-parens,bad-whitespace,locally-disabled,no-self-use,unnecessary-lambda,star-args,fixme,global-statement,bare-except,anomalous-backslash-in-string,broad-except,cyclic-import,bad-continuation,locally-enabled,unidiomatic-typecheck,redefined-variable-type,bad-option-value,wrong-import-position,consider-using-ternary,no-else-return,len-as-condition,inconsistent-return-statements,useless-object-inheritance,consider-using-in,useless-return,assignment-from-none,chained-comparison,import-outside-toplevel,use-a-generator,consider-using-with,consider-using-f-string,unspecified-encoding,use-maxsplit-arg,possibly-used-before-assignment
++disable=Design,Similarities,invalid-name,missing-docstring,line-too-long,too-many-lines,superfluous-parens,bad-whitespace,locally-disabled,no-self-use,unnecessary-lambda,star-args,fixme,global-statement,bare-except,anomalous-backslash-in-string,broad-except,cyclic-import,bad-continuation,locally-enabled,unidiomatic-typecheck,redefined-variable-type,bad-option-value,wrong-import-position,consider-using-ternary,no-else-return,len-as-condition,inconsistent-return-statements,useless-object-inheritance,consider-using-in,useless-return,assignment-from-none,chained-comparison,import-outside-toplevel,use-a-generator,consider-using-with,consider-using-f-string,unspecified-encoding,use-maxsplit-arg,possibly-used-before-assignment,c-extension-no-member
+ enable=fixme
+ 
+ 
+diff --git a/tests/data/cli/compare/virt-xml-update-nodefine-succeed.xml b/tests/data/cli/compare/virt-xml-update-nodefine-succeed.xml
+index bd94ece2f..10acbe3eb 100644
+--- a/tests/data/cli/compare/virt-xml-update-nodefine-succeed.xml
++++ b/tests/data/cli/compare/virt-xml-update-nodefine-succeed.xml
+@@ -11,10 +11,10 @@
+    </devices>
+  </domain>
+ 
+-    <interface type="user">
+-      <mac address="00:11:22:33:44:56"/>
+-      <model type="e1000"/>
+-    </interface>
++<interface type="user">
++  <mac address="00:11:22:33:44:56"/>
++  <model type="e1000"/>
++</interface>
+ 
+ 
+ Hotplug this device to the guest 'test'? (y/n): Device hotplug successful.
+diff --git a/tests/data/cli/compare/virt-xml-update-succeed.xml b/tests/data/cli/compare/virt-xml-update-succeed.xml
+index 8387aa94a..9f8a8900c 100644
+--- a/tests/data/cli/compare/virt-xml-update-succeed.xml
++++ b/tests/data/cli/compare/virt-xml-update-succeed.xml
+@@ -11,10 +11,10 @@
+    </devices>
+  </domain>
+ 
+-    <interface type="user">
+-      <mac address="00:11:22:33:44:55"/>
+-      <model type="e1000"/>
+-    </interface>
++<interface type="user">
++  <mac address="00:11:22:33:44:55"/>
++  <model type="e1000"/>
++</interface>
+ 
+ 
+ Hotplug this device to the guest 'test'? (y/n): Device hotplug successful.
+diff --git a/tests/data/xmlparse/add-devices-out.xml b/tests/data/xmlparse/add-devices-out.xml
+index bade6ec9b..c7c587551 100644
+--- a/tests/data/xmlparse/add-devices-out.xml
++++ b/tests/data/xmlparse/add-devices-out.xml
+@@ -8,7 +8,8 @@
+     <boot dev="hd"/>
+   </os>
+   <features>
+-    <acpi/><apic/>
++    <acpi/>
++    <apic/>
+   </features>
+   <clock offset="utc"/>
+   <on_poweroff>destroy</on_poweroff>
+diff --git a/tests/data/xmlparse/change-chars-out.xml b/tests/data/xmlparse/change-chars-out.xml
+index 95b69a302..29ab8415f 100644
+--- a/tests/data/xmlparse/change-chars-out.xml
++++ b/tests/data/xmlparse/change-chars-out.xml
+@@ -9,7 +9,8 @@
+     <boot dev="network"/>
+   </os>
+   <features>
+-    <acpi/><apic/>
++    <acpi/>
++    <apic/>
+   </features>
+   <clock offset="utc"/>
+   <on_poweroff>destroy</on_poweroff>
+diff --git a/tests/data/xmlparse/change-disk-out.xml b/tests/data/xmlparse/change-disk-out.xml
+index 003750fb2..54880abc1 100644
+--- a/tests/data/xmlparse/change-disk-out.xml
++++ b/tests/data/xmlparse/change-disk-out.xml
+@@ -9,7 +9,8 @@
+     <boot dev="hd"/>
+   </os>
+   <features>
+-    <acpi/><apic/>
++    <acpi/>
++    <apic/>
+   </features>
+   <clock offset="utc"/>
+   <on_poweroff>destroy</on_poweroff>
+diff --git a/tests/data/xmlparse/change-nics-out.xml b/tests/data/xmlparse/change-nics-out.xml
+index 85651ca7b..116f4db45 100644
+--- a/tests/data/xmlparse/change-nics-out.xml
++++ b/tests/data/xmlparse/change-nics-out.xml
+@@ -9,7 +9,8 @@
+     <boot dev="network"/>
+   </os>
+   <features>
+-    <acpi/><apic/>
++    <acpi/>
++    <apic/>
+   </features>
+   <clock offset="utc"/>
+   <on_poweroff>destroy</on_poweroff>
+diff --git a/tests/data/xmlparse/domain-roundtrip.xml b/tests/data/xmlparse/domain-roundtrip.xml
+index 0190c440d..859539363 100644
+--- a/tests/data/xmlparse/domain-roundtrip.xml
++++ b/tests/data/xmlparse/domain-roundtrip.xml
+@@ -13,32 +13,32 @@
+   <!-- intentional mis-indentation -->
+   <!-- more comments -->
+   <metadata>
+-      <herp2erp xmlns:foobar="http://foo.bar3/"/>
+-      <herp2erp xmlns:foobar="http://foo.bar3/"/>
+-      <herp2erp xmlns:foobar="http://foo.bar3/"/>
+-      <app1:foo xmlns:app1="http://foo.org/">fooish</app1:foo>
+-      <app3:foo xmlns:app3="http://foo.org/">fooish</app3:foo>
+-      <app1:foo xmlns:app1="http://foo.org/">fooish</app1:foo>
+-   <app2:bar xmlns:app2="http://bar.com/" maman="baz">barish</app2:bar>
+-      <app1:foo xmlns:app1="http://foo.org/">fooish</app1:foo>
+-   <app2:bar xmlns:app2="http://bar.com/" maman="baz">barish</app2:bar>
+-      <nova:instance xmlns:nova="http://openstack.org/xmlns/libvirt/nova/1.0">
+-        <nova:package version="2015.1"/>
+-        <nova:name>vm1</nova:name>
+-        <nova:creationTime>2015-02-19 18:23:44</nova:creationTime>
+-        <nova:flavor name="m1.tiny">
+-          <nova:memory>512</nova:memory>
+-          <nova:disk>1</nova:disk>
+-          <nova:swap>0</nova:swap>
+-          <nova:ephemeral>0</nova:ephemeral>
+-          <nova:vcpus>1</nova:vcpus>
+-        </nova:flavor>
+-        <nova:owner>
+-          <nova:user uuid="ef53a6031fc643f2af7add439ece7e9d">admin</nova:user>
+-          <nova:project uuid="60a60883d7de429aa45f8f9d689c1fd6">demo</nova:project>
+-        </nova:owner>
+-        <nova:root type="image" uuid="2344a0fc-a34b-4e2d-888e-01db795fc89a"/>
+-      </nova:instance>
++    <herp2erp xmlns:foobar="http://foo.bar3/"/>
++    <herp2erp xmlns:foobar="http://foo.bar3/"/>
++    <herp2erp xmlns:foobar="http://foo.bar3/"/>
++    <app1:foo xmlns:app1="http://foo.org/">fooish</app1:foo>
++    <app3:foo xmlns:app3="http://foo.org/">fooish</app3:foo>
++    <app1:foo xmlns:app1="http://foo.org/">fooish</app1:foo>
++    <app2:bar xmlns:app2="http://bar.com/" maman="baz">barish</app2:bar>
++    <app1:foo xmlns:app1="http://foo.org/">fooish</app1:foo>
++    <app2:bar xmlns:app2="http://bar.com/" maman="baz">barish</app2:bar>
++    <nova:instance xmlns:nova="http://openstack.org/xmlns/libvirt/nova/1.0">
++      <nova:package version="2015.1"/>
++      <nova:name>vm1</nova:name>
++      <nova:creationTime>2015-02-19 18:23:44</nova:creationTime>
++      <nova:flavor name="m1.tiny">
++        <nova:memory>512</nova:memory>
++        <nova:disk>1</nova:disk>
++        <nova:swap>0</nova:swap>
++        <nova:ephemeral>0</nova:ephemeral>
++        <nova:vcpus>1</nova:vcpus>
++      </nova:flavor>
++      <nova:owner>
++        <nova:user uuid="ef53a6031fc643f2af7add439ece7e9d">admin</nova:user>
++        <nova:project uuid="60a60883d7de429aa45f8f9d689c1fd6">demo</nova:project>
++      </nova:owner>
++      <nova:root type="image" uuid="2344a0fc-a34b-4e2d-888e-01db795fc89a"/>
++    </nova:instance>
+     <boxes:gnome-boxes xmlns:boxes="https://wiki.gnome.org/Apps/Boxes">
+       <os-state>installed</os-state>
+       <media>/tmp/media.iso</media>
+diff --git a/tests/data/xmlparse/network-vf-pool-out.xml b/tests/data/xmlparse/network-vf-pool-out.xml
+index 62a730501..c3e351fc2 100644
+--- a/tests/data/xmlparse/network-vf-pool-out.xml
++++ b/tests/data/xmlparse/network-vf-pool-out.xml
+@@ -1,6 +1,6 @@
+ <network>
+   <name>new-foo</name>
+-    <forward mode="hostdev" managed="yes">
+-      <pf dev="eth3"/>
+-    </forward>
++  <forward mode="hostdev" managed="yes">
++    <pf dev="eth3"/>
++  </forward>
+ </network>
+diff --git a/tests/test_cli.py b/tests/test_cli.py
+index d51df81c2..01d0f8002 100644
+--- a/tests/test_cli.py
++++ b/tests/test_cli.py
+@@ -1147,7 +1147,7 @@ c.add_invalid(
+ )  # URI doesn't support UEFI bits
+ c.add_invalid("--graphics type=vnc,keymap", grep="Option 'keymap' had no value set.")
+ c.add_invalid("--xml FOOXPATH", grep="form of XPATH=VALUE")  # failure parsing xpath value
+-c.add_invalid("--xml /@foo=bar", grep="/@foo xmlXPathEval")  # failure processing xpath
++c.add_invalid("--xml /@foo=bar", grep="/@foo Invalid expression")  # failure processing xpath
+ 
+ 
+ ########################
+diff --git a/tests/test_xmlparse.py b/tests/test_xmlparse.py
+index c4107f932..0e947e16c 100644
+--- a/tests/test_xmlparse.py
++++ b/tests/test_xmlparse.py
+@@ -421,10 +421,11 @@ def testAlterDevicesBootorder():
+ 
+ def testSingleDisk():
+     conn = utils.URIs.open_testdefault_cached()
+-    xml = (
+-        """<disk type="file" device="disk"><source file="/a.img"/>\n"""
+-        """<target dev="hda" bus="ide"/></disk>\n"""
+-    )
++    xml = """<disk type="file" device="disk">
++  <source file="/a.img"/>
++  <target dev="hda" bus="ide"/>
++</disk>
++"""
+     conn = utils.URIs.open_testdefault_cached()
+     d = virtinst.DeviceDisk(conn, parsexml=xml)
+     _set_and_check(d, "target", "hda", "hdb")
+@@ -1010,7 +1011,7 @@ def testXMLBuilderCoverage():
+         # Ensure we validate root element
+         virtinst.DeviceDisk(conn, parsexml="<foo/>")
+ 
+-    with pytest.raises(Exception, match=".*xmlParseDoc.*"):
++    with pytest.raises(Exception, match="can only parse strings"):
+         # Ensure we validate root element
+         virtinst.DeviceDisk(conn, parsexml=-1)
+ 
+@@ -1041,11 +1042,11 @@ def testXMLBuilderCoverage():
+     xml = conn.lookupByName("test-for-virtxml").XMLDesc(0)
+     guest = virtinst.Guest(conn, parsexml=xml)
+ 
+-    assert guest.features.get_xml().startswith("  <features")
+-    assert guest.clock.get_xml().startswith("  <clock")
++    assert guest.features.get_xml().startswith("<features")
++    assert guest.clock.get_xml().startswith("<clock")
+     assert guest.seclabels[0].get_xml().startswith("<seclabel")
+-    assert guest.cpu.get_xml().startswith("  <cpu")
+-    assert guest.os.get_xml().startswith("  <os")
++    assert guest.cpu.get_xml().startswith("<cpu")
++    assert guest.os.get_xml().startswith("<os")
+     assert guest.cpu.get_xml_id() == "./cpu"
+     assert guest.cpu.get_xml_idx() == 0
+     assert guest.get_xml_id() == "."
+diff --git a/virt-manager.spec.in b/virt-manager.spec.in
+index 9e7fca30e..41328bbc9 100644
+--- a/virt-manager.spec.in
++++ b/virt-manager.spec.in
+@@ -77,7 +77,7 @@ Summary: Common files used by the different Virtual Machine Manager interfaces
+ 
+ Requires: python3-argcomplete
+ Requires: python3-libvirt
+-Requires: python3-libxml2
++Requires: python3-lxml
+ Requires: python3-requests
+ Requires: libosinfo >= 0.2.10
+ # Required for gobject-introspection infrastructure
+diff --git a/virtinst/xmlapi.py b/virtinst/xmlapi.py
+index 6b6d7ce7e..4db2a7e85 100644
+--- a/virtinst/xmlapi.py
++++ b/virtinst/xmlapi.py
+@@ -4,7 +4,7 @@
+ # This work is licensed under the GNU GPLv2 or later.
+ # See the COPYING file in the top-level directory.
+ 
+-import libxml2
++from lxml import etree
+ 
+ from . import xmlutil
+ from .logger import log
+@@ -248,7 +248,7 @@ class _XMLBase(object):
+         xpathobj = _XPath(fullxpath)
+         parentxpath = "."
+         parentnode = self._find(parentxpath)
+-        if not parentnode:
++        if parentnode is None:
+             raise xmlutil.DevError("Did not find XML root node for xpath=%s" % fullxpath)
+ 
+         for xpathseg in xpathobj.segments[1:]:
+@@ -299,30 +299,11 @@ def node_is_text(n):
+     return bool(n and n.type == "text")
+ 
+ 
+-class _Libxml2API(_XMLBase):
++class _LxmlAPI(_XMLBase):
+     def __init__(self, xml):
+         _XMLBase.__init__(self)
+-
+-        # Use of gtksourceview in virt-manager changes this libxml
+-        # global setting which messes up whitespace after parsing.
+-        # We can probably get away with calling this less but it
+-        # would take some investigation
+-        libxml2.keepBlanksDefault(1)
+-
+-        self._doc = libxml2.parseDoc(xml)
+-        self._ctx = self._doc.xpathNewContext()
+-        self._ctx.setContextNode(self._doc.children)
+-        for key, val in self.NAMESPACES.items():
+-            self._ctx.xpathRegisterNs(key, val)
+-
+-    def __del__(self):
+-        if not hasattr(self, "_doc"):
+-            # In case we error when parsing the doc
+-            return
+-        self._doc.freeDoc()
+-        self._doc = None
+-        self._ctx.xpathFreeContext()
+-        self._ctx = None
++        self._parser = etree.XMLParser(remove_blank_text=True)
++        self._doc = etree.fromstring(xml, parser=self._parser)
+ 
+     def _sanitize_xml(self, xml):
+         if not xml.endswith("\n") and "\n" in xml:
+@@ -330,113 +311,74 @@ class _Libxml2API(_XMLBase):
+         return xml
+ 
+     def copy_api(self):
+-        return _Libxml2API(self._doc.children.serialize())
++        return _LxmlAPI(etree.tostring(self._doc, encoding="unicode", pretty_print=True))
+ 
+     def _find(self, fullxpath):
+         xpath = _XPath(fullxpath).xpath
+         try:
+-            node = self._ctx.xpathEval(xpath)
++            node = self._doc.xpath(xpath, namespaces=self.NAMESPACES)
+         except Exception as e:
+             log.debug("fullxpath=%s xpath=%s eval failed", fullxpath, xpath, exc_info=True)
+             raise RuntimeError("%s %s" % (fullxpath, str(e))) from None
+-        return node and node[0] or None
++        return node[0] if len(node) else None
+ 
+     def count(self, xpath):
+-        return len(self._ctx.xpathEval(xpath))
++        return len(self._doc.xpath(xpath, namespaces=self.NAMESPACES))
+ 
+     def _node_tostring(self, node):
+-        return node.serialize()
++        return etree.tostring(node, encoding="unicode", pretty_print=True)
+ 
+     def _node_from_xml(self, xml):
+-        return libxml2.parseDoc(xml).children
++        return etree.fromstring(xml, parser=self._parser)
+ 
+     def _node_get_text(self, node):
+-        return node.content
++        return node.text
+ 
+     def _node_set_text(self, node, setval):
+-        if setval is not None:
+-            setval = xmlutil.xml_escape(setval)
+-        node.setContent(setval)
++        node.text = setval
+ 
+     def _node_get_property(self, node, propname):
+-        prop = node.hasProp(propname)
+-        if prop:
+-            return prop.content
++        return node.get(propname)
+ 
+     def _node_set_property(self, node, propname, setval):
+         if setval is None:
+-            prop = node.hasProp(propname)
+-            if prop:
+-                prop.unlinkNode()
+-                prop.freeNode()
++            node.attrib.pop(propname, None)
+         else:
+-            node.setProp(propname, setval)
++            node.set(propname, setval)
+ 
+     def _node_new(self, xpathseg, parentnode):
+-        newnode = libxml2.newNode(xpathseg.nodename)
+-        if not xpathseg.nsname:
+-            return newnode
+-
+-        def _find_parent_ns():
+-            parent = parentnode
+-            while parent:
+-                for ns in xmlutil.listify(parent.nsDefs()):
+-                    if ns.name == xpathseg.nsname:
+-                        return ns
+-                parent = parent.get_parent()
+-
+-        ns = _find_parent_ns()
+-        if not ns:
+-            ns = newnode.newNs(self.NAMESPACES[xpathseg.nsname], xpathseg.nsname)
+-        newnode.setNs(ns)
+-        return newnode
++        name = xpathseg.nodename
++        nsmap = None
++        if xpathseg.nsname:
++            name = etree.QName(self.NAMESPACES[xpathseg.nsname], name)
++            nsmap = {xpathseg.nsname: self.NAMESPACES[xpathseg.nsname]}
++
++        return etree.Element(name, nsmap=nsmap)
+ 
+     def node_clear(self, xpath):
+         node = self._find(xpath)
+         if node:
+-            propnames = [p.name for p in (node.properties or [])]
+-            for p in propnames:
+-                node.unsetProp(p)
+-            node.setContent(None)
++            node.clear()
+ 
+     def _node_has_content(self, node):
+-        return node.type == "element" and (node.children or node.properties)
++        return etree.iselement(node) and (node.keys() or node.getchildren() or node.text)
+ 
+     def _node_get_name(self, node):
+-        return node.name
++        return etree.QName(node).localname
+ 
+     def _node_remove_child(self, parentnode, childnode):
+-        node = childnode
+-
+-        # Look for preceding whitespace and remove it
+-        white = node.get_prev()
+-        if node_is_text(white):
+-            white.unlinkNode()
+-            white.freeNode()
+-
+-        node.unlinkNode()
+-        node.freeNode()
+-        if all([node_is_text(n) for n in parentnode.children]):
+-            parentnode.setContent(None)
++        parentnode.remove(childnode)
++        if len(parentnode.getchildren()) == 0:
++            parentnode.text = None
+ 
+     def _node_add_child(self, parentxpath, parentnode, newnode):
+-        ignore = parentxpath
+-        if not node_is_text(parentnode.get_last()):
+-            prevsib = parentnode.get_prev()
+-            if node_is_text(prevsib):
+-                newlast = libxml2.newText(prevsib.content)
+-            else:
+-                newlast = libxml2.newText("\n")
+-            parentnode.addChild(newlast)
+-
+-        endtext = parentnode.get_last().content
+-        parentnode.addChild(libxml2.newText("  "))
+-        parentnode.addChild(newnode)
+-        parentnode.addChild(libxml2.newText(endtext))
++        parentnode.append(newnode)
++        if parentnode.text and parentnode.text.isspace():
++            parentnode.text = None
+ 
+     def _node_replace_child(self, xpath, newnode):
+         oldnode = self._find(xpath)
+-        oldnode.replaceNode(newnode)
++        oldnode.getparent().replace(oldnode, newnode)
+ 
+ 
+-XMLAPI = _Libxml2API
++XMLAPI = _LxmlAPI
+-- 
+2.49.0
+
diff --git a/recipes-extended/virt-manager/virt-manager_git.bb b/recipes-extended/virt-manager/virt-manager_git.bb
index 9d206641..17f27d64 100644
--- a/recipes-extended/virt-manager/virt-manager_git.bb
+++ b/recipes-extended/virt-manager/virt-manager_git.bb
@@ -8,6 +8,7 @@ SRCREV = "4f9618289f279f86994a5d2f1aada8a6524f5a6f"
 SRC_URI = " \
   git://github.com/virt-manager/virt-manager;branch=main;protocol=https \
   file://0001-build-drop-man-directory.patch \
+  file://0001-xmlapi-rewrite-the-code-to-use-lxml-instead-of-libxm.patch \
 "
 
 PV = "v5.0.0+git"
@@ -33,7 +34,7 @@ RDEPENDS:${PN}-common += " \
 RDEPENDS:${PN} = " \
   ${PN}-common \
   libvirt-glib \
-  libxml2-python \
+  python3-xml \
   gdk-pixbuf \
   gtk+3 \
   hicolor-icon-theme \
@@ -43,7 +44,7 @@ RDEPENDS:${PN} = " \
 RDEPENDS:${PN}-install = " \
   ${PN}-common \
   libvirt-virsh \
-  libxml2-python \
+  python3-xml \
   python3-pygobject \
   python3-requests \
 "
-- 
2.34.1


