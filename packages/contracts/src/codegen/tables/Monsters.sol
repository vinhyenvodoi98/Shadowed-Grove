// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("Monsters")));
bytes32 constant MonstersTableId = _tableId;

struct MonstersData {
  uint32 x;
  uint32 y;
  bytes32 owner;
  uint32 health;
  uint32 attack;
  uint32 defence;
  string image;
}

library Monsters {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](7);
    _schema[0] = SchemaType.UINT32;
    _schema[1] = SchemaType.UINT32;
    _schema[2] = SchemaType.BYTES32;
    _schema[3] = SchemaType.UINT32;
    _schema[4] = SchemaType.UINT32;
    _schema[5] = SchemaType.UINT32;
    _schema[6] = SchemaType.STRING;

    return SchemaLib.encode(_schema);
  }

  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.UINT256;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's metadata */
  function getMetadata() internal pure returns (string memory, string[] memory) {
    string[] memory _fieldNames = new string[](7);
    _fieldNames[0] = "x";
    _fieldNames[1] = "y";
    _fieldNames[2] = "owner";
    _fieldNames[3] = "health";
    _fieldNames[4] = "attack";
    _fieldNames[5] = "defence";
    _fieldNames[6] = "image";
    return ("Monsters", _fieldNames);
  }

  /** Register the table's schema */
  function registerSchema() internal {
    StoreSwitch.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Register the table's schema (using the specified store) */
  function registerSchema(IStore _store) internal {
    _store.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Set the table's metadata */
  function setMetadata() internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    StoreSwitch.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Set the table's metadata (using the specified store) */
  function setMetadata(IStore _store) internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    _store.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Get x */
  function getX(uint256 id) internal view returns (uint32 x) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0);
    return (uint32(Bytes.slice4(_blob, 0)));
  }

  /** Get x (using the specified store) */
  function getX(IStore _store, uint256 id) internal view returns (uint32 x) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0);
    return (uint32(Bytes.slice4(_blob, 0)));
  }

  /** Set x */
  function setX(uint256 id, uint32 x) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    StoreSwitch.setField(_tableId, _keyTuple, 0, abi.encodePacked((x)));
  }

  /** Set x (using the specified store) */
  function setX(IStore _store, uint256 id, uint32 x) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    _store.setField(_tableId, _keyTuple, 0, abi.encodePacked((x)));
  }

  /** Get y */
  function getY(uint256 id) internal view returns (uint32 y) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 1);
    return (uint32(Bytes.slice4(_blob, 0)));
  }

  /** Get y (using the specified store) */
  function getY(IStore _store, uint256 id) internal view returns (uint32 y) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 1);
    return (uint32(Bytes.slice4(_blob, 0)));
  }

  /** Set y */
  function setY(uint256 id, uint32 y) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    StoreSwitch.setField(_tableId, _keyTuple, 1, abi.encodePacked((y)));
  }

  /** Set y (using the specified store) */
  function setY(IStore _store, uint256 id, uint32 y) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    _store.setField(_tableId, _keyTuple, 1, abi.encodePacked((y)));
  }

  /** Get owner */
  function getOwner(uint256 id) internal view returns (bytes32 owner) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 2);
    return (Bytes.slice32(_blob, 0));
  }

  /** Get owner (using the specified store) */
  function getOwner(IStore _store, uint256 id) internal view returns (bytes32 owner) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 2);
    return (Bytes.slice32(_blob, 0));
  }

  /** Set owner */
  function setOwner(uint256 id, bytes32 owner) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    StoreSwitch.setField(_tableId, _keyTuple, 2, abi.encodePacked((owner)));
  }

  /** Set owner (using the specified store) */
  function setOwner(IStore _store, uint256 id, bytes32 owner) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    _store.setField(_tableId, _keyTuple, 2, abi.encodePacked((owner)));
  }

  /** Get health */
  function getHealth(uint256 id) internal view returns (uint32 health) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 3);
    return (uint32(Bytes.slice4(_blob, 0)));
  }

  /** Get health (using the specified store) */
  function getHealth(IStore _store, uint256 id) internal view returns (uint32 health) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 3);
    return (uint32(Bytes.slice4(_blob, 0)));
  }

  /** Set health */
  function setHealth(uint256 id, uint32 health) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    StoreSwitch.setField(_tableId, _keyTuple, 3, abi.encodePacked((health)));
  }

  /** Set health (using the specified store) */
  function setHealth(IStore _store, uint256 id, uint32 health) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    _store.setField(_tableId, _keyTuple, 3, abi.encodePacked((health)));
  }

  /** Get attack */
  function getAttack(uint256 id) internal view returns (uint32 attack) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 4);
    return (uint32(Bytes.slice4(_blob, 0)));
  }

  /** Get attack (using the specified store) */
  function getAttack(IStore _store, uint256 id) internal view returns (uint32 attack) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 4);
    return (uint32(Bytes.slice4(_blob, 0)));
  }

  /** Set attack */
  function setAttack(uint256 id, uint32 attack) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    StoreSwitch.setField(_tableId, _keyTuple, 4, abi.encodePacked((attack)));
  }

  /** Set attack (using the specified store) */
  function setAttack(IStore _store, uint256 id, uint32 attack) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    _store.setField(_tableId, _keyTuple, 4, abi.encodePacked((attack)));
  }

  /** Get defence */
  function getDefence(uint256 id) internal view returns (uint32 defence) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 5);
    return (uint32(Bytes.slice4(_blob, 0)));
  }

  /** Get defence (using the specified store) */
  function getDefence(IStore _store, uint256 id) internal view returns (uint32 defence) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 5);
    return (uint32(Bytes.slice4(_blob, 0)));
  }

  /** Set defence */
  function setDefence(uint256 id, uint32 defence) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    StoreSwitch.setField(_tableId, _keyTuple, 5, abi.encodePacked((defence)));
  }

  /** Set defence (using the specified store) */
  function setDefence(IStore _store, uint256 id, uint32 defence) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    _store.setField(_tableId, _keyTuple, 5, abi.encodePacked((defence)));
  }

  /** Get image */
  function getImage(uint256 id) internal view returns (string memory image) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 6);
    return (string(_blob));
  }

  /** Get image (using the specified store) */
  function getImage(IStore _store, uint256 id) internal view returns (string memory image) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 6);
    return (string(_blob));
  }

  /** Set image */
  function setImage(uint256 id, string memory image) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    StoreSwitch.setField(_tableId, _keyTuple, 6, bytes((image)));
  }

  /** Set image (using the specified store) */
  function setImage(IStore _store, uint256 id, string memory image) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    _store.setField(_tableId, _keyTuple, 6, bytes((image)));
  }

  /** Get the length of image */
  function lengthImage(uint256 id) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 6, getSchema());
    return _byteLength / 1;
  }

  /** Get the length of image (using the specified store) */
  function lengthImage(IStore _store, uint256 id) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 6, getSchema());
    return _byteLength / 1;
  }

  /** Get an item of image (unchecked, returns invalid data if index overflows) */
  function getItemImage(uint256 id, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    bytes memory _blob = StoreSwitch.getFieldSlice(_tableId, _keyTuple, 6, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Get an item of image (using the specified store) (unchecked, returns invalid data if index overflows) */
  function getItemImage(IStore _store, uint256 id, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 6, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Push a slice to image */
  function pushImage(uint256 id, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    StoreSwitch.pushToField(_tableId, _keyTuple, 6, bytes((_slice)));
  }

  /** Push a slice to image (using the specified store) */
  function pushImage(IStore _store, uint256 id, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    _store.pushToField(_tableId, _keyTuple, 6, bytes((_slice)));
  }

  /** Pop a slice from image */
  function popImage(uint256 id) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    StoreSwitch.popFromField(_tableId, _keyTuple, 6, 1);
  }

  /** Pop a slice from image (using the specified store) */
  function popImage(IStore _store, uint256 id) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    _store.popFromField(_tableId, _keyTuple, 6, 1);
  }

  /** Update a slice of image at `_index` */
  function updateImage(uint256 id, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    StoreSwitch.updateInField(_tableId, _keyTuple, 6, _index * 1, bytes((_slice)));
  }

  /** Update a slice of image (using the specified store) at `_index` */
  function updateImage(IStore _store, uint256 id, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    _store.updateInField(_tableId, _keyTuple, 6, _index * 1, bytes((_slice)));
  }

  /** Get the full data */
  function get(uint256 id) internal view returns (MonstersData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, uint256 id) internal view returns (MonstersData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    bytes memory _blob = _store.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(
    uint256 id,
    uint32 x,
    uint32 y,
    bytes32 owner,
    uint32 health,
    uint32 attack,
    uint32 defence,
    string memory image
  ) internal {
    bytes memory _data = encode(x, y, owner, health, attack, defence, image);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    StoreSwitch.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using individual values (using the specified store) */
  function set(
    IStore _store,
    uint256 id,
    uint32 x,
    uint32 y,
    bytes32 owner,
    uint32 health,
    uint32 attack,
    uint32 defence,
    string memory image
  ) internal {
    bytes memory _data = encode(x, y, owner, health, attack, defence, image);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    _store.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using the data struct */
  function set(uint256 id, MonstersData memory _table) internal {
    set(id, _table.x, _table.y, _table.owner, _table.health, _table.attack, _table.defence, _table.image);
  }

  /** Set the full data using the data struct (using the specified store) */
  function set(IStore _store, uint256 id, MonstersData memory _table) internal {
    set(_store, id, _table.x, _table.y, _table.owner, _table.health, _table.attack, _table.defence, _table.image);
  }

  /** Decode the tightly packed blob using this table's schema */
  function decode(bytes memory _blob) internal view returns (MonstersData memory _table) {
    // 52 is the total byte length of static data
    PackedCounter _encodedLengths = PackedCounter.wrap(Bytes.slice32(_blob, 52));

    _table.x = (uint32(Bytes.slice4(_blob, 0)));

    _table.y = (uint32(Bytes.slice4(_blob, 4)));

    _table.owner = (Bytes.slice32(_blob, 8));

    _table.health = (uint32(Bytes.slice4(_blob, 40)));

    _table.attack = (uint32(Bytes.slice4(_blob, 44)));

    _table.defence = (uint32(Bytes.slice4(_blob, 48)));

    // Store trims the blob if dynamic fields are all empty
    if (_blob.length > 52) {
      uint256 _start;
      // skip static data length + dynamic lengths word
      uint256 _end = 84;

      _start = _end;
      _end += _encodedLengths.atIndex(0);
      _table.image = (string(SliceLib.getSubslice(_blob, _start, _end).toBytes()));
    }
  }

  /** Tightly pack full data using this table's schema */
  function encode(
    uint32 x,
    uint32 y,
    bytes32 owner,
    uint32 health,
    uint32 attack,
    uint32 defence,
    string memory image
  ) internal view returns (bytes memory) {
    uint40[] memory _counters = new uint40[](1);
    _counters[0] = uint40(bytes(image).length);
    PackedCounter _encodedLengths = PackedCounterLib.pack(_counters);

    return abi.encodePacked(x, y, owner, health, attack, defence, _encodedLengths.unwrap(), bytes((image)));
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple(uint256 id) internal pure returns (bytes32[] memory _keyTuple) {
    _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));
  }

  /* Delete all data for given keys */
  function deleteRecord(uint256 id) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, uint256 id) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256((id)));

    _store.deleteRecord(_tableId, _keyTuple);
  }
}
