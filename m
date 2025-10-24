Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE22BCCF9E3
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 13:19:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10884.1761311987012690643
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 06:19:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KpbL3hyp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23922b9735=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59O52Xtf2797868
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Oct 2025 13:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=nMlm0dTqXkpshvwRQexG
	C71lL9mPahMGleUgdZ2za6M=; b=KpbL3hypEzCC+PVr4aV+YGfFUBEEEcxN5gP1
	5LpxUZ02kA/2fxfYXenhYU5/ahQ536NdDpPGoGetewCQLwwgrGGNFEqNohWUDC4e
	eMtTL52216dg0J92XrGZoUr2d3CmrtLSmobk4JxFHN24VEBJnNYqJ7wZqUhum+S4
	8FDqTgSpWGwxgQjTHofEnL8/x5yf60Nnasxcg6lSZmfPa1rj+s8N3hXWoZbAe+jt
	iisGa5oR9aB9evIxnDhmEuG+YztHLx95A9nsemEQTbLT9s+RfFhvLT86/+A4ddyv
	2W9mFJrjkLMFKv3fL2Iol5pPK/srjIILSA8tmtwHbX8eI2l8WA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49y8athxeh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Oct 2025 13:19:46 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 24 Oct 2025 06:19:44 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 24 Oct 2025 06:19:43 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][meta-cloud-services][kirkstone][PATCH 1/1]  python3-ansible: Fix CVE-2024-11079
Date: Fri, 24 Oct 2025 18:49:39 +0530
Message-ID: <20251024131939.1235109-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=N9ck1m9B c=1 sm=1 tr=0 ts=68fb7cf2 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=5h67h_9zRmsA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PYnjg3YJAAAA:8 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=zJgFPqLZnLv5tOtA8RAA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=6_D5ljFcL1GZDUJyZucp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI0MDExOSBTYWx0ZWRfX36EkPiMzsAmj
 Og2nPv2niMwP8c3a3fYbJ6sPdSL6zRsY0wNcBN/cemY0AN58ePHuAR/M8uQGuyhepZejq6W9BPW
 AiVgv+N1CLKfnTi7byLFmc1Q287ve//Kx+eCptkOarGCLYj24psZP2Bt891EnF2eIg8TeuEhncL
 BfVgoqstEaTQlA8jMxl8s5QwIERdLCBo7Wke6u6jYYZxf4xkXjGo3Z12PbfAw5xvj0Uw8FkXx/z
 cGoJgkClSSR1VWLKmYMl2obgWMnWauIgyE4KkKZhqEqydfMKSQq8jzRL0h9h8pZagTugAFVbxgK
 xOZxrDbcXcaG2/eseTkAefDqOgYYIPIQ/qVd4MlJe835G7WwzJVw7UN7iLoC9REGmU6CjbYDaxK
 2C/N5rXICQMhNG+x4QZPTGgkHzdO9g==
X-Proofpoint-ORIG-GUID: THztnbNTD5G0kKdgqIc10xayuW663owt
X-Proofpoint-GUID: THztnbNTD5G0kKdgqIc10xayuW663owt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 phishscore=0 suspectscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510240119
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Oct 2025 13:19:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9424

From: Soumya Sambu <soumya.sambu@windriver.com>

A flaw was found in Ansible-Core. This vulnerability allows attackers to bypass
unsafe content protections using the hostvars object to reference and execute
templated content. This issue can lead to arbitrary code execution if remote
data or module outputs are improperly templated within playbooks.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-11079
https://security-tracker.debian.org/tracker/CVE-2024-11079

Upstream patch:
https://github.com/ansible/ansible/commit/70e83e72b43e05e57eb42a6d52d01a4d9768f510

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../python3-ansible/CVE-2024-11079.patch      | 362 ++++++++++++++++++
 .../python/python3-ansible_2.14.18.bb         |   1 +
 2 files changed, 363 insertions(+)
 create mode 100644 recipes-devtools/python/python3-ansible/CVE-2024-11079.patch

diff --git a/recipes-devtools/python/python3-ansible/CVE-2024-11079.patch b/recipes-devtools/python/python3-ansible/CVE-2024-11079.patch
new file mode 100644
index 00000000..b6da58a3
--- /dev/null
+++ b/recipes-devtools/python/python3-ansible/CVE-2024-11079.patch
@@ -0,0 +1,362 @@
+From 70e83e72b43e05e57eb42a6d52d01a4d9768f510 Mon Sep 17 00:00:00 2001
+From: Jordan Borean <jborean93@gmail.com>
+Date: Tue, 26 Nov 2024 01:15:42 +1000
+Subject: [PATCH] Fix CVE-2024-11079 hostvars unsafe context (#84339) (#84353)
+
+Fix to preserve an unsafe variable when accessing through an
+intermediary variable from hostvars.
+
+(cherry picked from commit 2936b80dbbc7efb889934aeec80f6142c10266ce)
+
+CVE: CVE-2024-11079
+
+Upstream-Status: Backport [https://github.com/ansible/ansible/commit/70e83e72b43e05e57eb42a6d52d01a4d9768f510]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ changelogs/fragments/unsafe_hostvars_fix.yml  |   2 +
+ lib/ansible/template/__init__.py              |  31 +----
+ lib/ansible/template/native_helpers.py        | 122 +++++++++++++++++-
+ lib/ansible/vars/hostvars.py                  |   7 +-
+ .../targets/template/cve-2024-11079.yml       |  30 +++++
+ test/integration/targets/template/runme.sh    |   4 +
+ 6 files changed, 159 insertions(+), 37 deletions(-)
+ create mode 100644 changelogs/fragments/unsafe_hostvars_fix.yml
+ create mode 100644 test/integration/targets/template/cve-2024-11079.yml
+
+diff --git a/changelogs/fragments/unsafe_hostvars_fix.yml b/changelogs/fragments/unsafe_hostvars_fix.yml
+new file mode 100644
+index 0000000000..cf7ca888e2
+--- /dev/null
++++ b/changelogs/fragments/unsafe_hostvars_fix.yml
+@@ -0,0 +1,2 @@
++security_fixes:
++  - Templating will not prefer AnsibleUnsafe when a variable is referenced via hostvars - CVE-2024-11079
+diff --git a/lib/ansible/template/__init__.py b/lib/ansible/template/__init__.py
+index c45cfe350e..46994e2455 100644
+--- a/lib/ansible/template/__init__.py
++++ b/lib/ansible/template/__init__.py
+@@ -49,7 +49,7 @@ from ansible.module_utils.six import string_types, text_type
+ from ansible.module_utils._text import to_native, to_text, to_bytes
+ from ansible.module_utils.common.collections import is_sequence
+ from ansible.plugins.loader import filter_loader, lookup_loader, test_loader
+-from ansible.template.native_helpers import ansible_native_concat, ansible_eval_concat, ansible_concat
++from ansible.template.native_helpers import AnsibleUndefined, ansible_native_concat, ansible_eval_concat, ansible_concat
+ from ansible.template.template import AnsibleJ2Template
+ from ansible.template.vars import AnsibleJ2Vars
+ from ansible.utils.display import Display
+@@ -296,35 +296,6 @@ def _wrap_native_text(func):
+     return _update_wrapper(wrapper, func)
+ 
+ 
+-class AnsibleUndefined(StrictUndefined):
+-    '''
+-    A custom Undefined class, which returns further Undefined objects on access,
+-    rather than throwing an exception.
+-    '''
+-    def __getattr__(self, name):
+-        if name == '__UNSAFE__':
+-            # AnsibleUndefined should never be assumed to be unsafe
+-            # This prevents ``hasattr(val, '__UNSAFE__')`` from evaluating to ``True``
+-            raise AttributeError(name)
+-        # Return original Undefined object to preserve the first failure context
+-        return self
+-
+-    def __getitem__(self, key):
+-        # Return original Undefined object to preserve the first failure context
+-        return self
+-
+-    def __repr__(self):
+-        return 'AnsibleUndefined(hint={0!r}, obj={1!r}, name={2!r})'.format(
+-            self._undefined_hint,
+-            self._undefined_obj,
+-            self._undefined_name
+-        )
+-
+-    def __contains__(self, item):
+-        # Return original Undefined object to preserve the first failure context
+-        return self
+-
+-
+ class AnsibleContext(Context):
+     '''
+     A custom context, which intercepts resolve_or_missing() calls and sets a flag
+diff --git a/lib/ansible/template/native_helpers.py b/lib/ansible/template/native_helpers.py
+index 3014c74507..cfa6070ef4 100644
+--- a/lib/ansible/template/native_helpers.py
++++ b/lib/ansible/template/native_helpers.py
+@@ -7,13 +7,19 @@ __metaclass__ = type
+ 
+ 
+ import ast
++from collections.abc import Mapping
+ from itertools import islice, chain
+ from types import GeneratorType
+ 
++from ansible.module_utils.common.collections import is_sequence
+ from ansible.module_utils._text import to_text
+ from ansible.module_utils.six import string_types
+ from ansible.parsing.yaml.objects import AnsibleVaultEncryptedUnicode
+ from ansible.utils.native_jinja import NativeJinjaText
++from ansible.utils.unsafe_proxy import wrap_var
++import ansible.module_utils.compat.typing as t
++
++from jinja2.runtime import StrictUndefined
+ 
+ 
+ _JSON_MAP = {
+@@ -30,6 +36,40 @@ class Json2Python(ast.NodeTransformer):
+         return ast.Constant(value=_JSON_MAP[node.id])
+ 
+ 
++def _is_unsafe(value: t.Any) -> bool:
++    """
++    Our helper function, which will also recursively check dict and
++    list entries due to the fact that they may be repr'd and contain
++    a key or value which contains jinja2 syntax and would otherwise
++    lose the AnsibleUnsafe value.
++    """
++    to_check = [value]
++    seen = set()
++
++    while True:
++        if not to_check:
++            break
++
++        val = to_check.pop(0)
++        val_id = id(val)
++
++        if val_id in seen:
++            continue
++        seen.add(val_id)
++
++        if isinstance(val, AnsibleUndefined):
++            continue
++        if isinstance(val, Mapping):
++            to_check.extend(val.keys())
++            to_check.extend(val.values())
++        elif is_sequence(val):
++            to_check.extend(val)
++        elif getattr(val, '__UNSAFE__', False):
++            return True
++
++    return False
++
++
+ def ansible_eval_concat(nodes):
+     """Return a string of concatenated compiled nodes. Throw an undefined error
+     if any of the nodes is undefined.
+@@ -45,17 +85,28 @@ def ansible_eval_concat(nodes):
+     if not head:
+         return ''
+ 
++    unsafe = False
++
+     if len(head) == 1:
+         out = head[0]
+ 
+         if isinstance(out, NativeJinjaText):
+             return out
+ 
++        unsafe = _is_unsafe(out)
+         out = to_text(out)
+     else:
+         if isinstance(nodes, GeneratorType):
+             nodes = chain(head, nodes)
+-        out = ''.join([to_text(v) for v in nodes])
++
++        out_values = []
++        for v in nodes:
++            if not unsafe and _is_unsafe(v):
++                unsafe = True
++
++            out_values.append(to_text(v))
++
++        out = ''.join(out_values)
+ 
+     # if this looks like a dictionary, list or bool, convert it to such
+     if out.startswith(('{', '[')) or out in ('True', 'False'):
+@@ -70,6 +121,9 @@ def ansible_eval_concat(nodes):
+         except (ValueError, SyntaxError, MemoryError):
+             pass
+ 
++    if unsafe:
++        out = wrap_var(out)
++
+     return out
+ 
+ 
+@@ -80,7 +134,19 @@ def ansible_concat(nodes):
+ 
+     Used in Templar.template() when jinja2_native=False and convert_data=False.
+     """
+-    return ''.join([to_text(v) for v in nodes])
++    unsafe = False
++    values = []
++    for v in nodes:
++        if not unsafe and _is_unsafe(v):
++            unsafe = True
++
++        values.append(to_text(v))
++
++    out = ''.join(values)
++    if unsafe:
++        out = wrap_var(out)
++
++    return out
+ 
+ 
+ def ansible_native_concat(nodes):
+@@ -97,6 +163,8 @@ def ansible_native_concat(nodes):
+     if not head:
+         return None
+ 
++    unsafe = False
++
+     if len(head) == 1:
+         out = head[0]
+ 
+@@ -117,10 +185,21 @@ def ansible_native_concat(nodes):
+         # short-circuit literal_eval for anything other than strings
+         if not isinstance(out, string_types):
+             return out
++
++        unsafe = _is_unsafe(out)
++
+     else:
+         if isinstance(nodes, GeneratorType):
+             nodes = chain(head, nodes)
+-        out = ''.join([to_text(v) for v in nodes])
++
++        out_values = []
++        for v in nodes:
++            if not unsafe and _is_unsafe(v):
++                unsafe = True
++
++            out_values.append(to_text(v))
++
++        out = ''.join(out_values)
+ 
+     try:
+         evaled = ast.literal_eval(
+@@ -130,10 +209,45 @@ def ansible_native_concat(nodes):
+             ast.parse(out, mode='eval')
+         )
+     except (ValueError, SyntaxError, MemoryError):
++        if unsafe:
++            out = wrap_var(out)
++
+         return out
+ 
+     if isinstance(evaled, string_types):
+         quote = out[0]
+-        return f'{quote}{evaled}{quote}'
++        evaled = f'{quote}{evaled}{quote}'
++
++    if unsafe:
++        evaled = wrap_var(evaled)
+ 
+     return evaled
++
++
++class AnsibleUndefined(StrictUndefined):
++    """
++    A custom Undefined class, which returns further Undefined objects on access,
++    rather than throwing an exception.
++    """
++    def __getattr__(self, name):
++        if name == '__UNSAFE__':
++            # AnsibleUndefined should never be assumed to be unsafe
++            # This prevents ``hasattr(val, '__UNSAFE__')`` from evaluating to ``True``
++            raise AttributeError(name)
++        # Return original Undefined object to preserve the first failure context
++        return self
++
++    def __getitem__(self, key):
++        # Return original Undefined object to preserve the first failure context
++        return self
++
++    def __repr__(self):
++        return 'AnsibleUndefined(hint={0!r}, obj={1!r}, name={2!r})'.format(
++            self._undefined_hint,
++            self._undefined_obj,
++            self._undefined_name
++        )
++
++    def __contains__(self, item):
++        # Return original Undefined object to preserve the first failure context
++        return self
+diff --git a/lib/ansible/vars/hostvars.py b/lib/ansible/vars/hostvars.py
+index e6679efed6..76a5bdb70d 100644
+--- a/lib/ansible/vars/hostvars.py
++++ b/lib/ansible/vars/hostvars.py
+@@ -110,11 +110,12 @@ class HostVars(Mapping):
+         return self._find_host(host_name) is not None
+ 
+     def __iter__(self):
+-        for host in self._inventory.hosts:
+-            yield host
++        # include implicit localhost only if it has variables set
++        yield from self._inventory.hosts | {'localhost': self._inventory.localhost} if self._inventory.localhost else {}
+ 
+     def __len__(self):
+-        return len(self._inventory.hosts)
++        # include implicit localhost only if it has variables set
++        return len(self._inventory.hosts) + (1 if self._inventory.localhost else 0)
+ 
+     def __repr__(self):
+         out = {}
+diff --git a/test/integration/targets/template/cve-2024-11079.yml b/test/integration/targets/template/cve-2024-11079.yml
+new file mode 100644
+index 0000000000..00eb16d995
+--- /dev/null
++++ b/test/integration/targets/template/cve-2024-11079.yml
+@@ -0,0 +1,30 @@
++- name: test CVE-2024-11079 loop variables preserve unsafe hostvars
++  hosts: localhost
++  gather_facts: false
++  tasks:
++  - set_fact:
++      foo:
++        safe:
++          prop: '{{ "{{" }} unsafe_var {{ "}}" }}'
++        unsafe:
++          prop: !unsafe '{{ unsafe_var }}'
++
++  - name: safe var through hostvars loop is templated
++    assert:
++      that:
++      - item.prop == expected
++    loop:
++    - "{{ hostvars['localhost']['foo']['safe'] }}"
++    vars:
++      unsafe_var: bar
++      expected: bar
++
++  - name: unsafe var through hostvars loop is not templated
++    assert:
++      that:
++      - item.prop == expected
++    loop:
++    - "{{ hostvars['localhost']['foo']['unsafe'] }}"
++    vars:
++      unsafe_var: bar
++      expected: !unsafe '{{ unsafe_var }}'
+diff --git a/test/integration/targets/template/runme.sh b/test/integration/targets/template/runme.sh
+index 30163af7db..08b14b86f2 100755
+--- a/test/integration/targets/template/runme.sh
++++ b/test/integration/targets/template/runme.sh
+@@ -38,6 +38,10 @@ ansible-playbook 72262.yml -v "$@"
+ # ensure unsafe is preserved, even with extra newlines
+ ansible-playbook unsafe.yml -v "$@"
+ 
++# CVE 2024-11079
++ANSIBLE_JINJA2_NATIVE=true ansible-playbook cve-2024-11079.yml -v "$@"
++ANSIBLE_JINJA2_NATIVE=false ansible-playbook cve-2024-11079.yml -v "$@"
++
+ # ensure Jinja2 overrides from a template are used
+ ansible-playbook in_template_overrides.yml -v "$@"
+ 
+-- 
+2.40.0
+
diff --git a/recipes-devtools/python/python3-ansible_2.14.18.bb b/recipes-devtools/python/python3-ansible_2.14.18.bb
index f3ab2377..96956061 100644
--- a/recipes-devtools/python/python3-ansible_2.14.18.bb
+++ b/recipes-devtools/python/python3-ansible_2.14.18.bb
@@ -9,4 +9,5 @@ RDEPENDS:${PN} += "python3-pyyaml \
 
 SRC_URI += " \
     file://python3-ensure-py-scripts-use-py3-for-shebang.patch \
+    file://CVE-2024-11079.patch \
 "
-- 
2.40.0


