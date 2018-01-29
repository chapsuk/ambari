/**
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.apache.ambari.server.registry;

import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Represents a single instance of a service in a registry mpack
 */
public interface RegistryMpackService {

  /**
   * Get name
   * @return
   */
  @JsonProperty("name")
  public String getName();

  /**
   * Get version
   * @return
   */
  @JsonProperty("version")
  public String getVersion();

}